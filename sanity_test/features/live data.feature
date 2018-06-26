@fast_sanity
Feature: Using Live Data
  In order for a teacher to monitor students' progress in real-time
  As a student and a teacher
  I want student activity to show on the teacher dashboard.
  
  Scenario: A teacher should be able to reset live data
    Given I am signed in as a teacher
    And I am on the dashboard
    When I click on the green button with the class name on it
    And I click on the Data settings panel
    Then I should see a button to reset live data
  