Feature: The app should allow the user to reset their password if they forgot it
  Scenario: A user forgets his password has a way to get a reset link
    Given a user that forgot his password
    When the user goes to the forgot password page
    And the user fills in his email in the forgot password form
    Then the user should receive an email with a reset link
  
  Scenario: A user is able to reset their password with a reset link
    Given a user that forgot his password
    And is a valid user with email "alberto@amorales.us" and password "working123"
    When the user goes to the forgot password page
    And the user fills in his email: "alberto@amorales.us" in the forgot password form
    Then the user should receive an email with a reset link
    When the user goes to the reset link from the email
    Then user should be presented with a reset your password form
    When the user fills in the new password: "somenewpassword123!" and submits the forgot password form
    Then the user should be redirected to the login page
    When the user enters his correct credentials in the login page, email: "alberto@amorales.us" and password "somenewpassword123!"
    And submits the login page
    Then the user should be shown the root page


