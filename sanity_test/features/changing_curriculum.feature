@changing_curriculum
Feature: changing the curriculum of an existing school
  In order to change the set of skills available to all users in a school
  As a teacher
  I want to change the curriculum

  Scenario: Clicking on more information
    Given I am signed in as a teacher with a school
    And I am on the maths skills page
    When I click on the more information link under standards
    Then I should see more information about standards
    When I click on the hide details link
    Then I should not see the extra information about standards

  Scenario: Cancelling maths standards change by clicking cancel
    Given I am signed in as a teacher with a school
    And I have maths standards set to classic skills
    And I am on the maths skills page
    When I select common core
    Then I should see the confirm or cancel standards change pop up
    When I click to cancel the standards change
    Then I should not see the confirm or cancel standards change pop up
    And my current maths standards should be classic skills

  Scenario: Confirming maths standards change
    Given I am signed in as a teacher with a school
    And I have maths standards set to classic skills
    And I am on the maths skills page
    When I change the maths standards for my school to common core
    Then my current maths standards should be common core

  Scenario: Confirming reading standards change
    Given I am signed in as a teacher with a subscription
    And I have reading standards set to classic skills
    And I am on the maths skills page
    When I click on the reading skills tab
    Then I should be on the reading skills page
    When I change the reading standards for my school to common core ela
    Then my current reading standards should be common core ela

  Scenario: Confirming writing standards change
    Given I am signed in as a teacher with a school
    And I have writing standards set to classic skills (us)
    And I am on the maths skills page
    When I click on the writing skills tab
    Then I should be on the writing skills page
    When I change the writing standards for my school to classic skills (gb)
    Then my current writing standards should be classic skills (gb)
