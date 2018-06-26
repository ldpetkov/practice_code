Feature: Entering contests
  In order to encourage competitive learning
  As a teacher
  I want to be able to sign students up for contests

  Scenario: Opening the contests page as a teacher in a school with undefined neighbourhood
    Given I am signed in as a teacher with a school that does not have a neighbourhood selected
    And I am on the teacher dashboard
    When I click on the contests link
    Then I should be asked to choose my neighbourhood

  Scenario: Opening the entries page for a contest
    Given I am signed in as a teacher with a school that has a neighbourhood selected
    And I am on the contests page
    When I click on the entries link for a contest
    Then I should be taken to the entries page

  Scenario: Entering my school into a contest
    Given I am signed in as a teacher with a school that has a neighbourhood selected
    And I am on the contests page
    When I try to enter a contest
    And I choose to enter class A
    Then class A should be entered into the contest

  Scenario: Cancelling leaving a contest
    Given I am signed in as a teacher with a school that is participating in a contest
    And I am on the contests page
    When I begin to leave the contest but cancel
    Then I should still be on the contests page
    And class A should still be participating in the contest

  Scenario: Leaving a contest
    Given I am signed in as a teacher with a school that is participating in a contest
    And I am on the contests page
    When I leave the contest
    Then I should no longer be in the contest
    And I should be able to reenter the contest on the contests page
