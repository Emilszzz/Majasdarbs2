Feature: Login in feature
  User to test login for the super cool api

  Scenario: Log in -positive
  Given I have logged in as regular user
  Then I check if I am logged in

  Scenario: Log in without password
  Given I try to log in without a password
  Then I check if I am not logged in

  Scenario: Check profile firstName
  Given I have logged in as regular user
  Then I check profile information
  Then I change profile firstName
  And I check profile firstName
