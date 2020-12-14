# Capybara Selenium Sample
![LambdaTest Logo](https://www.lambdatest.com/static/images/logo.svg)

### Environment Setup
 * For Windows
     You can download Ruby for Windows from http://rubyinstaller.org/
     Run the installer and follow the setup wizard to install Ruby.

 * For Linux/Mac: 
     Download RVM and install Ruby: curl -L https://get.rvm.io | bash -s stable --ruby
     
## Lambdatest Credentials
   * Set LambdaTest username and access key in environment variables. It can be obtained from [LambdaTest dashboard]   (https://automation.lambdatest.com/)     
   
   example:
 * For linux/mac    
    ```
    export LT_USERNAME="YOUR_USERNAME"
    export LT_ACCESS_KEY="YOUR ACCESS KEY"
    ```
 * For Windows
    ```
    set LT_USERNAME="YOUR_USERNAME"
    set LT_ACCESS_KEY="YOUR ACCESS KEY"
    ```
## Setup
 * Clone the repo
 * Install dependencies `bundle install`
 * Update `*.config.yml` files inside the `config/` directory with your [Lmabdatest Username and Access Key]

### Running your tests
 * To run a single test, run `bundle exec rake single`
 * To run parallel tests, run `bundle exec rake parallel`

#####  Routing traffic through your local machine
- Set tunnel value to `true` in test capabilities
> OS specific instructions to download and setup tunnel binary can be found at the following links.
>    - [Windows](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+Windows)
>    - [Mac](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+MacOS)
>    - [Linux](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+Linux)

## Notes
 * You can view your test results on the [Lambdatest Automate dashboard]
 * To test on a different set of browsers, check out our [platform configurator](http://labs.lambdatest.com/app-lambda/capabilities-generator/capabilities-generator.html)
 
 ## About LambdaTest

[LambdaTest](https://www.lambdatest.com/) is a cloud based selenium grid infrastructure that can help you run automated cross browser compatibility tests on 2000+ different browser and operating system environments. LambdaTest supports all programming languages and frameworks that are supported with Selenium, and have easy integrations with all popular CI/CD platforms. It's a perfect solution to bring your [selenium automation testing](https://www.lambdatest.com/selenium-automation) to cloud based infrastructure that not only helps you increase your test coverage over multiple desktop and mobile browsers, but also allows you to cut down your test execution time by running tests on parallel.

  
### Resources

##### [SeleniumHQ Documentation](http://www.seleniumhq.org/docs/)
##### [Capybara Documentation](https://www.rubydoc.info/github/jnicklas/capybara)
##### [Ruby Documentation](https://ruby-doc.org/)
##### [Travis CI Documentation](https://www.lambdatest.com/support/docs/display/TD/Travis+CI+with+LambdaTest)
