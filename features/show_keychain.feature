Feature: Show the keychain record
  Background: A user logs into the application
    Given a user is not logged in
    And is a valid user with email "alberto@amorales.us" and password "working123"
    When the user goes to the root page of the application
    Then the user should be redirected to the login page
    When the user enters his correct credentials in the login page, email: "alberto@amorales.us" and password "working123"    
    And submits the login page
    Then the user should be shown the root page
  
  Scenario: A user goes to see the keychain record
    Given an existing keychain with name "foo"
    When the user goes to view the keychain with the name "foo"
    Then the user should be shown the keychain with the name "foo"
    And the show page should have a link to edit the keychain with the name "foo"
    And the show page should have a link to delete the keychain with the name "foo"
    And the admin is emailed that the keychain "foo" was shown to a user
