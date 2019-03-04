Feature: BrowserStack Local Testing

Background:
  Given I am on http://bs-local.com:45691/check

Scenario: Can check tunnel working
  Then I should see "Up and running"
