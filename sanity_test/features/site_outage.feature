@site_outage
Feature: Using Sumdog
  In order check the site is not down
  As a guest
  I want to be able to load the city top

  @guest_signin
  Scenario: Can log in as a guest and see the city top
    Given I am on the homepage
    When I sign in as a guest
    Then I should be on the city
    And I check for the city top load