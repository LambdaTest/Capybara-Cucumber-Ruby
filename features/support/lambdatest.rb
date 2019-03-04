require 'yaml'
require 'selenium/webdriver'
require 'capybara/cucumber'

# monkey patch to avoid reset sessions
class Capybara::Selenium::Driver < Capybara::Driver::Base
  def reset!
    if @browser
      @browser.navigate.to('about:blank')
    end
  end
end

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'single'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../../config/#{CONFIG_NAME}.config.yml")))
CONFIG['user'] = ENV['LT_USERNAME'] || CONFIG['user']
CONFIG['key'] = ENV['LT_ACCESS_KEY'] || CONFIG['key']


Capybara.register_driver :lambdatest do |app|
  @caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])


if (CONFIG_NAME=='jenkins')
puts ENV['LT_GRID_URL']
lt_browser = ENV['LT_BROWSER_NAME']	
lt_os = ENV['LT_PLATFORM']
lt_browser_version = ENV['LT_BROWSER_VERSION']
lt_res = ENV['LT_RESOLUTION']
@caps={"browserName"=>lt_browser, "version"=>lt_browser_version, "platform"=>lt_os, "resolution"=>lt_res, "build"=>"capybara-lambdatest", "name"=>"single-Test-Jenkins","video"=>true, "network"=>true, "console"=>true, "visual"=>true }

Capybara::Selenium::Driver.new(app,
	    :browser => :remote,
	    :url => ENV['LT_GRID_URL'],
	    :desired_capabilities => @caps
	  )

else 
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :url => "https://#{CONFIG['user']}:#{CONFIG['key']}@#{CONFIG['server']}/wd/hub",
    :desired_capabilities => @caps
  )
end
end

Capybara.default_driver = :lambdatest
Capybara.run_server = false
