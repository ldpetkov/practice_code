Feature: Using Live Data
  In order for a teacher to monitor students' progress in real-time
  As a student and a teacher
  I want student activity to show on the teacher dashboard.
  
  @fast_sanity
  Scenario: A teacher should be able to reset live data
    Given I am signed in as a teacher
    And I am on the dashboard
    When I click on the class controls panel
    And I click on the data settings option
    Then I should see a button to reset live data
    
  @fast_sanity  
  Scenario: A teacher should be able to change the subject used on the live data table
    Given I am signed in as a teacher
    And I am on the dashboard
    When I click on the class controls panel
    And I click on the choose subject option
    Then I should be able to change the subject to writing
    And the table will show the live data for writing
    
  Scenario: A teacher should be able to restrict students to a particular subject
    Given I am signed in as a teacher
    And I am on the dashboard
    When I click on the live data heading
    Then I should be able to restrict the subjects that students can use
    
  Scenario: A teacher can use the news feed to monitor students
    Given I am signed in as a teacher
    And I am on the dashboard
    When I click on the class controls panel
    And I click on the news feed option
    Then I should be on the news feed
    
  @fast_sanity  @sikuli
  Scenario: Once it has started recording, the news feed will monitor students
    Given I am signed in as a teacher
    And I have started recording a live session
    When a student finishes a game
    Then their progress will be shown on the news feed