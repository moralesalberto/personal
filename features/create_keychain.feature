Feature: Create a keychain record

  Background: A user logs into the application
    Given a user is not logged in
    And is a valid user with email "alberto@amorales.us" and password "working123"
    When the user goes to the root page of the application
    Then the user should be redirected to the login page
    When the user enters his correct credentials in the login page, email: "alberto@amorales.us" and password "working123"    
    And submits the login page
    Then the user should be shown the root page

  Scenario: A user creates a keychain record
    When the user goes to the new keychain page
    And fills in the keychain name: "name of the key"
    And username: "theusername"
    And password: "thepassword"
    And description: "This is a key that I use all the time"
    And submits the new keychain form
    Then a new keychain record is created with the name "name of the key", and password: "thepassword"
    And the user is shown the new keychain show page
    And the admin is emailed that the keychain "name of the key" was shown to a user

