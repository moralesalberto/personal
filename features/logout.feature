Feature: A user logs out of the application
  Scenario: A logged in user logs out of the application
    Given a user is not logged in
    And is a valid user with email "alberto@amorales.us" and password "working123"
    When the user goes to the root page of the application
    Then the user should be redirected to the login page
    When the user enters his correct credentials in the login page, email: "alberto@amorales.us" and password "working123"
    And submits the login page
    Then the user should be shown the root page
    When the user clicks on the logout link
    Then the user should be redirected the login page

  Scenario: A user logs out and then tries to go back to the application
    Given a user is not logged in
    And is a valid user with email "alberto@amorales.us" and password "working123"
    When the user goes to the root page of the application
    Then the user should be redirected to the login page
    When the user enters his correct credentials in the login page, email: "alberto@amorales.us" and password "working123"    
    And submits the login page
    Then the user should be shown the root page
    When the user clicks on the logout link
    Then the user should be redirected the login page
    And if the user attempts to go to the root page again
    Then the user should be redirected to the login page



