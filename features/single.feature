Feature: Add to Todo list functionality

Background:
  Given I am on https://lambdatest.github.io/sample-todo-app/

Scenario: Add Todo List
    When I click on first item
    When I click on second item
    When I add new item "New item to the list"
    Then I should see new item in list "New item to the list"
