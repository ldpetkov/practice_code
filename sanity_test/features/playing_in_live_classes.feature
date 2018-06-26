@live_class
@play_in_live_class
@Sikuli

Feature: Playing in live classes
  In order for my teacher to check my progress in real-time
  As a student
  I want to play in live classes

  Scenario: A student participating in a live class can play games
    Given I am signed in as a teacher with a school with at least one class
    And I have an active Maths Training live class
    When I sign in as a student who is in the class
    Then I should be able to play Talent Show

  Scenario: A student participating in a live class cannot change their subject
    Given I am signed in as a teacher with a subscription
    And I have an active Reading Training live class
    When I sign in as a student in the subscribed school
    And I click on the subject panel
    Then I should only be able to choose the reading subject

  Scenario: Changes made to the live class will show up for students once they refresh the hangout
    Given I am signed in as a teacher with a school with at least one class
    And I have an active Maths training live class
    And I am signed in as a student who is in the class
    When the teacher changes the subject of the class to Writing
    And the student refreshes the page
    Then the student should be in a writing game lobby
