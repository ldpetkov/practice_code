@fast_sanity

Feature: Using the house
  In order to view and redecorate my house or change my avatar
  As a teacher 
  I want to access my house
  
  Scenario: Uses can change their clothes
    Given I am logged in as the sanity teacher
    And I am on the dashboard	
    When I click on the Play panel
    And I click on the House panel
    Then I should see a clothes panel
    
    