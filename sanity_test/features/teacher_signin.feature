@teacher
@signin
Feature: Signing in as a teacher
  I want to be able to sign in to my account
  As a teacher with a Sumdog account
  So I can use the site

  Scenario: Signing in as a teacher on the homepage using global username
    Given I am on the homepage
    When I sign in on the homepage as a teacher using a global username
    Then I should be signed in

  Scenario: Signing in as a teacher on the homepage using a scoped username
    Given I am on the homepage
    When I sign in on the homepage as a teacher using a scoped username
    Then I should be signed in

  Scenario: Signing in as a teacher on the homepage using an email address
    Given I am on the homepage
    When I sign in on the homepage as a teacher using an email address
    Then I should be signed in

  Scenario: Attempting to sign in with a wrong password
    Given I am on the homepage
    When I sign in on the sign in page as a teacher using an incorrect password
    Then I should not be signed in

  Scenario: Attempting to sign in with a invalid username
    Given I am on the homepage
    When I sign in on the homepage as a teacher using an invalid username
    Then I should not be signed in