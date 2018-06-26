@parent
@signup
@email


Feature: Signing up as a parent
  As a parent
  I want to sign up to Sumdog
  So I can use the site
  
  @fast_sanity
  Scenario: Signing up with an invalid email address and non-matching passwords gives correct error message
    Given I am on the homepage
    When I manually navigate to the parent sign up page 
    And I try to sign up as a parent with invalid details
    Then I should see the appropriate sign up validation errors
    
  @fast_sanity
  Scenario: Signing up with the terms of use box unchecked gives a correct error message
    Given I am on the homepage
    When I manually navigate to the parent sign up page 
    When I try to sign up as a parent without accepting terms of use
    Then I should not be able to click sign up
    
  @fast_sanity
  Scenario: Entering correct details should allow the user to sign up
    Given I am on the homepage
    When I manually navigate to the parent sign up page 
    When I try to sign up as a parent with valid details
    Then I should be taken to the parent registration confirmation page
    When I go to the homepage
    Then I should be taken to the email not confirmed page
  
  Scenario: Clicking the link on the confirmation email should take me to the parent dashboard
    Given I have successfully signed up as a parent
    Then I should be taken to the new parent dashboard
    And I should be signed in