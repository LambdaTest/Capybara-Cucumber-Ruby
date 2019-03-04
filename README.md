# capybara-lambdatest


## Setup
* Clone the repo
* Install dependencies `bundle install`
* Update `*.config.yml` files inside the `config/` directory with your [Lmabdatest Username and Access Key]

### Running your tests
* To run a single test, run `bundle exec rake single`
* To run local tests, run `bundle exec rake local`
* To run parallel tests, run `bundle exec rake parallel`

 

## Notes
* You can view your test results on the [Lambdatest Automate dashboard]
* To test on a different set of browsers, check out our [platform configurator](http://labs.lambdatest.com/app-lambda/capabilities-generator/capabilities-generator.html)
* You can export the environment variables for the Username and Access Key of your Lambdatest account
  
  ```
  export LT_USERNAME=<LT-username> &&
  export LT_APIKEY=<LT-access-key>
  ```
  
