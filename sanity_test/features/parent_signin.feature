@parent
@signin
@email
@fast_sanity
Feature: Signing in as a parent 
  I want to be able to sign in to my account
  As a parent with a Sumdog account
  So I can use the site

  Scenario: Signing in as a parent on the homepage using global username
    Given I am on the homepage
    When I sign in on the homepage as a parent using a global username
    Then I should be on the parent dashboard

  Scenario: Signing in as a parent on the homepage using an email address
    Given I sign in on the homepage as a parent using an email address
    Then I should be on the parent dashboard
    And I should be signed in

  Scenario: Attempting to sign in with a wrong password
    Given I am on the homepage
    When I sign in on the homepage as a parent using an incorrect password
    Then I should not be signed in

  Scenario: Attempting to sign in with an invalid email address
    Given I am on the homepage
    When I sign in on the homepage as a parent using an invalid email address
    Then I should not be signed in
