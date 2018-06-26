@student
@signin
Feature: Signing in as a student 
  I want to be able to sign in to my account
  As a student with a Sumdog account
  So I can use the site

  Scenario: Signing in as a student on the homepage using global username
    Given I am on the homepage
    When I sign in on the homepage as a student using a global username
    Then I should be on the hangout

  Scenario: Signing in as a student on the homepage using a scoped username
    Given I sign in on the homepage as a student using a scoped username
    Then I should be on the hangout
    And I should be signed in

  Scenario: Attempting to sign in with a wrong password
    Given I am on the homepage
    When I sign in on the homepage as a student using an incorrect password
    Then I should not be signed in
