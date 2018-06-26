@WIP
Feature: Teacher activities
  In order to manage activities
  As a teacher
  I want to set up and test activities

  Scenario: Accessing the activities page
    Given I am signed in as a teacher
    When I click to go to activities
    Then I should be on the activities page

  Scenario: Trying to access reading activities as a free user
    Given I am signed in as a teacher with a school
    And I am on the maths activities page
    When I click on the reading activities tab
    Then I should be notified that I need a subscription

  Scenario: Using reading skills as a paid user
    Given I am signed in as a teacher with a subscription
    And I am on the maths activities page
    When I click on the reading activities tab
    Then I should be on the reading activities page

  Scenario: Accessing writing activities
    Given I am signed in as a teacher
    And I am on the maths activities page
    When I click on the writing activities tab
    Then I should be on the writing activities page

  Scenario: Setting up a maths competition
    Given I am signed in as a teacher with a subscription
    And I am on the maths activities page
    When I set up a new competition
    Then my competition should be a current activity

  Scenario: Setting up a reading challenge
    Given I am signed in as a teacher with a subscription
    And I am on the reading activities page
    When I set up a new challenge
    Then my challenge should be a current activity

  Scenario: Editing and deleting a maths activity
    Given I am signed in as a teacher with a subscription
    And I am on the maths activities page
    And I have a current activity
    When I make changes to an activity
    Then I should see the activity changes I have made
    When I delete the activity
    Then I should no longer see the activity

  Scenario: Viewing a maths activity's statistics
    Given I am signed in as a teacher with a subscription
    And I have some students who have played some games in an activity
    And I am on the maths activities page
    When I click to view the activity
    Then I should see activity information and statistics

    # Below I have omitted the skills scenario for now as the skill selection will get an overhaul soon

#  Scenario: Editing a student's skills
#    Given I am signed in as a teacher with a subscription
#    And I am on the maths activities page
#    And I have a current activity
#    When I restrict a student's skills for the activity
#    Then I should see the changes in the skills table
#    And the student should be able to see that their skills are restricted in the hangout

  Scenario: Checking past activities
    Given I am signed in as a teacher with a subscription
    And I have a maths activity which has ended
    When I go to the maths activities page
    Then I should see it listed under past activities
    And I can view an old activity
