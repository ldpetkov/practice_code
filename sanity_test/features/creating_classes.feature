@teacher
@class
Feature: Creating classes
  I want to create classes
  As a teacher
  In order to model my real life school classes on sumdog

  Scenario: Adding, editing and deleting a class
     Given I am signed in as a teacher with a school
     And I am on the classes page
     When I create a new class
     Then I should be taken to the classes page
     And there should be a new class in my school
     And I should be assigned to the newly created class
     When I click on the edit classes button
     Then I should be taken to the edit classes page
     When I edit the details of one of my classes
     Then the details of that class should be changed
     And I should be taken to the classes page
     When I delete a class
     Then the class should be removed from my school
    
  Scenario: Cancelling creating a class
    Given I am signed in as a teacher with a school
    And I am on the classes page
    When I click on the new class button
    Then I should see the new class pop up
    When I click cancel
    Then I should no longer see the new class pop up
    And no school should be created
