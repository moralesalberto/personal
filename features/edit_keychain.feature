Feature: Editing of keychains
  Background: A user logs into the application
    Given a user is not logged in
    And is a valid user with email "alberto@amorales.us" and password "working123"
    When the user goes to the root page of the application
    Then the user should be redirected to the login page
    When the user enters his correct credentials in the login page, email: "alberto@amorales.us" and password "working123"    
    And submits the login page
    Then the user should be shown the root page

  Scenario: A user edits the name of a keychain record
    Given an existing keychain with name "foo"
    When the user goes to the edit keychain with the name "foo"
    And fills in the name of the keychain to "bar"
    And submits the keychain edit form
    Then the keychain record should be updated with the name "bar"

  Scenario: A user attempts to edits the name of a keychain record with the same name of another keychain
    Given an existing keychain with name "first_one"
    And another existing keychaing with the name "second_one"
    When the user goes to the edit keychain with the name "second_one"
    And fills in the name of the keychain to "first_one"
    And submits the keychain edit form
    Then the user should be shown an error "Name has already been taken"
    And should be shown the edit page again
