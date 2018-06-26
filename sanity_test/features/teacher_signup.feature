@teacher
@signup
@email
Feature: Signing up as a teacher
  As a teacher
  I want to sign up to Sumdog
  So I can use the site

  Scenario: Entering correct details should allow the user to sign up
    Given I am on the homepage
    When I manually navigate to the teacher sign up page
    When I try to sign up as a teacher with valid details
    Then I should be taken to the teacher registration confirmation page
    When I click the Sumdog icon
    Then I should be taken to the email not confirmed page

  Scenario: Signing up with an invalid email address and non-matching passwords gives correct error message
    Given I am on the teacher sign up page
    When I try to sign up as a teacher with invalid details
    Then I should see the appropriate sign up validation errors

  Scenario: Signing up with the terms of use box unchecked gives a correct error message
    Given I am on the teacher sign up page
    When I try to sign up as a teacher without accepting terms of use
    Then I should see the terms and conditions error message

  Scenario: Clicking the link on the confirmation email should take me to the teacher dashboard
    Given I have successfully signed up as a teacher
    Then I should be taken to the teacher dashboard
    And I should be signed in
