

Feature: Using assessments
  In order to test my students on sumdog
  As a teacher and students
  I want to use assessments
  
  Scenario: unsubscribed teachers are unable to create assessments
    Given I am signed in as a teacher without a subscription
    And I am on the dashboard
    When I click on the assessments panel
    And I click on the create assessment option
    Then I should be told that assessments are a premium feature
   
  @fast_sanity
  Scenario: A subscribed teacher should be able to choose the skills used in the assessment
    Given I am signed in as a teacher with a subscription 
    When I manually navigate to the create assessment form
    And I click to choose my skills
    Then I should see the skill browser
  
  Scenario: A subscribed teacher should be able to review the questions before creating an assessment
    Given I am signed in as a teacher with a subscription 
    And I am on the dashboard
    When I manually navigate to the create assessment form 
    And I click to review my questions
    Then I should see each of the questions
 
  @fast_sanity
  Scenario: A subscribed teacher should be able to change the questions before creating an assessment
    Given I am signed in as a teacher with a subscription 
    And I am on the dashboard
    When I manually navigate to the create assessment form 
    And I click to review my questions
    Then I should be able to refresh them
    
    
  @fast_sanity
  Scenario:Students can participate in assessments
    Given I am signed in as a teacher with a subscription
    When the teacher creates an assessment
    When I sign in as a student who is in the class
    Then the student should be able to play in it
    
    
  Scenario: After a student has finished an assessment the teacher should be able to see the results
    Given I am signed in as a teacher with a subscription
    When the teacher creates an assessment
    When I sign in as a student who is in the class
    And the student has finished it
    Then the teacher should be able to see their results
          