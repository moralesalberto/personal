Feature: Delete a keychain record
  Background: A user logs into the application
    Given a user is not logged in
    And is a valid user with email "alberto@amorales.us" and password "working123"
    When the user goes to the root page of the application
    Then the user should be redirected to the login page
    When the user enters his correct credentials in the login page, email: "alberto@amorales.us" and password "working123"    
    And submits the login page
    Then the user should be shown the root page

  Scenario: A user deletes a keychain record
    Given an existing keychain with name "mouse"
    When the user goes to view the keychain with the name "mouse"
    Then the user should be shown the keychain with the name "mouse"
    When the user clicks on the delete keychain link
    Then the user should see a confirmation whether to delete the keychain with the name "mouse"
    And the user clicks OK to the delete kechain confirmation
    Then the keychain with the name "mouse" should be deleted
    And the user should be shown the root page
    

