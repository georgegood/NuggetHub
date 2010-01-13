Feature: Authenticate Users
  In order to be able to contribute to the site
  a user
  wants to be able to login

  Scenario: Successful login
    Given I am the registered user andy.pike
      And I am on the login page
    When I fill in "Username" with "andy.pike"
      And I fill in "Password" with "secret"
      And I press "Login"
    Then I should see "Welcome back to NuggetHub."

  Scenario: Unsuccessful login
    Given I am not a registered user
      And I am on the login page
    When I fill in "Username" with "a guess"
      And I fill in "Password" with "wrong password"
      And I press "Login"
    Then I should see "Username/Password combination is not valid"
