@teacher_live_class
Feature: Set up for live classes
  In order to monitor my students' progress in real time
  As a teacher who has a Sumdog account
  I want to set up live classes

  Scenario: A teacher can cancel the set up of a live class 
    Given I am signed in as a teacher
    And I am on the live class set up page
    When I cancel setting up a maths training live class
    Then I should be taken to the teacher dashboard

  Scenario: A teacher can create a live class 
    Given I am signed in as a teacher
    And I am on the live class set up page
    When I set up a maths training live class
    Then there should be an active live class
    
  Scenario: A teacher with an active live class can end their lesson
    Given I am signed in as a teacher with a subscription
    And I have an active maths training live class
    When I stop the live class
    Then I should not have an active live class

  Scenario: A teacher can edit a running live class 
    Given I am signed in as a teacher
    And I have an active maths training live class
    When I change the activity of the live class to tables
    Then the live class activity should be changed to tables

 Scenario: The live class page should update when a student finishes a game     
    Given I am signed in as a teacher
    And I have an active maths training live class
    When a student participating in the live class plays a game
    Then the live class table should update with their score
 
  Scenario: A teacher with an active live class and a subscription should be able to view a report
    Given I am signed in as a teacher with a subscription
    And I have an active maths training live class
    When I click on the report button for the live class
    Then I should be taken to the reports page
    
  Scenario: A teacher can open the shop for a live class 
    Given I am signed in as a teacher
    When I set up a maths training live class
    Then students in the live class should not be able to open the wardrobe
    When I open the shop for students in the live class
    Then students in the live class should be able to open the wardrobe
