Feature: A user needs to log-in before using the app
  Scenario: A user that has not logged in goes to the root page of the application
    Given a user is not logged in
    When the user goes to the root page of the application
    Then the user should be redirected to the login page

  Scenario: A logged in user goes to the root page of the application
    Given a user is not logged in
    When the user goes to the root page of the application
    Then the user should be redirected to the login page
    When the user enters his correct credentials in the login page
    And submits the login page
    Then the user should be shown the root page

  Scenario: A user attempts to login with the incorrect password
    Given a user is not logged in
    When the user goes to the root page of the application
    Then the user should be redirected to the login page
    When the user enters the incorrect password in the login page
    And submits the login page
    Then the user should be redirected to the login page

  Scenario: A user attempts to login with the incorrect username
    Given a user is not logged in
    When the user goes to the root page of the application
    Then the user should be redirected to the login page
    When the user enters the incorrect email in the login page
    And submits the login page
    Then the user should be redirected to the login page

