require 'yaml'
require 'selenium/webdriver'
require 'capybara/cucumber'

class Capybara::Selenium::Driver < Capybara::Driver::Base
  def reset!
    @browser&.navigate&.to('about:blank')
  end
end

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'single'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../../config/#{CONFIG_NAME}.config.yml")))
CONFIG['user'] = ENV['LT_USERNAME'] || CONFIG['user']
CONFIG['key'] = ENV['LT_ACCESS_KEY'] || CONFIG['key']

Capybara.register_driver :lambdatest do |app|

  @caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])


  lt_options = {
    "build" => "capybara-lambdatest",
    "name" => CONFIG_NAME == 'jenkins' ? "single-Test-Jenkins" : "single-Test",
    "network" => true,
    "video" => true,
    "console" => true,
    "visual" => true
  }

  lt_options["platformName"] = @caps["platformName"] || @caps["platform"] || "Windows 11"
  lt_options["browserVersion"] = @caps["browserVersion"] || @caps["version"] || "latest"

  browser_name = @caps["browserName"] || "chrome"
  options =
    case browser_name.downcase
    when "chrome"
      Selenium::WebDriver::Options.chrome
    when "firefox"
      Selenium::WebDriver::Options.firefox
    when "edge"
      Selenium::WebDriver::Options.edge
    else
      Selenium::WebDriver::Options.chrome
    end

  options.add_option("LT:Options", lt_options)

  remote_url =
    if CONFIG_NAME == 'jenkins'
      ENV['LT_GRID_URL']
    else
      "https://#{CONFIG['user']}:#{CONFIG['key']}@#{CONFIG['server']}/wd/hub"
    end

  Capybara::Selenium::Driver.new(app,
    browser: :remote,
    url: remote_url,
    capabilities: options
  )
end

Capybara.default_driver = :lambdatest
Capybara.run_server = false
