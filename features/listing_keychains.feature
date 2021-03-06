Feature: Display a list of keychains
  Background: A user logs into the application
    Given a user is not logged in
    And is a valid user with email "alberto@amorales.us" and password "working123"
    When the user goes to the root page of the application
    Then the user should be redirected to the login page
    When the user enters his correct credentials in the login page, email: "alberto@amorales.us" and password "working123"    
    And submits the login page
    Then the user should be shown the root page

  Scenario: An authorized user sees the list of keychains
    Given there are several keychains in the system, with names "foo, bar, other"
    When the user goes to the listing of keychains page
    Then the keychains listing page is presented
    And the list of keychains should be shown, with names "foo, bar, other"

  Scenario: An authorized user searches for a given keychain
    Given there are several keychains in the system, with names "one, two, three"
    And there is an input field to do the search of keychains
    When the user searches for keychain "one"
    Then the keychains listing page is presented
    And the list of keychains should be shown, with names "one"


