Feature: A user should be presented with a login before using the app
  Scenario: A user goes to the root url of the application without being logged in
    Given a user not logged in
    When the user attempts to go to the root page of the application
    Then the user should be redirected to the login page

