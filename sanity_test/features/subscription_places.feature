@WIP
Feature: Assigning subscription places
  As a teacher
  I should be able to assign and remove subscription places from my students
  So that I can manage the access to the subscription bonuses

  Scenario: Getting to the subscription assignment box
    Given that I am signed in as a teacher in a school that has a subscription
    And I am on the teacher subscription page
    When I choose which students are subscribed
    Then I should see the subscription assignment box

  Scenario: Attempting to assign too many students
    Given that I am signed in as a teacher in a school that has a subscription
    And I am on the subscription assignment box
    When I try to assign subscription places to more students than I have places available
    Then I should be asked to deselect some students
    And I should not be able to save the changes

  Scenario: Assigning subscription places and cancelling
    Given that I am signed in as a teacher in a school that has a subscription
    And I am on the subscription assignment box
    When I try to assign subscription places to some students
    And I click on cancel in the confirmation box
    Then I should be on the subscription box
    And my changes should not be saved

  Scenario: Assigning subscription places
    Given that I am signed in as a teacher in a school that has a subscription
    And I am on the subscription assignment box
    When I try to assign subscription places to some students
    And I confirm the changes in the confirmation box
    Then I should be on the subscription page
    And the students should be subscribed

  Scenario: Removing subscription places
    Given that I am signed in as a teacher in a school that has a subscription and some reassignments
    And I am on the subscription assignment box
    When I try to remove subscription places from some students
    And I confirm the changes in the confirmation
    Then the students should be reassigned
    And I should lose a reassignments

  Scenario: Attempting to remove a subscription place with no reassignments left
    Given that I am signed in as a teacher in a school that has a subscription and no reassignments
    And I am on the subscription assignment box
    When I try to remove subscription places from students
    Then I should see a dialog box informing me I have no reassignments left
    And the students should still be subscribed
