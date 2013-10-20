Feature: A user should be able to change his password
  Background: A user logs into the application
    Given a user is not logged in
    And is a valid user with email "alberto@amorales.us" and password "working123"
    When the user goes to the root page of the application
    Then the user should be redirected to the login page
    When the user enters his correct credentials in the login page, email: "alberto@amorales.us" and password "working123"    
    And submits the login page
    Then the user should be shown the root page

  Scenario: A user that is logged in should be able to change their password
    When the user goes to the change password page
    And fills in current password: "working123", new password: "newpasswordHere!", and new password confirmation "newpasswordHere!"
    And submits the change password form
    Then the user should be redirected to the login page
    When the user enters his correct credentials in the login page, email: "alberto@amorales.us" and password "newpasswordHere!"
    And submits the login page
    Then the user should be shown the root page

  Scenario: A user that that attempts to change their password should get an error if they enter the wrong current password
    When the user goes to the change password page
    And fills in current password: "thispassword!", new password: "newpasswordHere!", and new password confirmation "newpasswordHere!"
    And submits the change password form
    Then the user should be shown the error "Current password is invalid"
    And sent back to the change password form
