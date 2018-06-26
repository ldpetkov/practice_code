Feature: using teacher reports
  In order to check how my students are doing
  As a teacher
  I want to generate and view teacher reports

  Scenario: Attempting to use free reports and then cancelling
    Given I create a teacher in a school without a subscription
    And I am on the reports page
    When I try to generate a report for a class but cancel on the free reports pop-up
    Then I should not see the report

  Scenario: Using up a free report
    Given I create a teacher in a school without a subscription
    And I am on the reports page
    When I generate a report for a class and choose to use a free report
    Then I should see the report

  @fast_sanity
  Scenario: Generating a report for subscribed students
    Given I am signed in as a teacher with a subscription
    And I am on the reports page
    When I generate a report for the class
    Then I should not see the free reports pop up
    And I should see the report

  Scenario: Accessing bar charts
    Given I am signed in as a teacher with a subscription
    And I am on the reports page
    When I click on the bar chart button
    Then I should see the bar chart report

  Scenario: Viewing bar charts for a specific skill or topic
    Given I am signed in as a teacher with a subscription
    And I am on the reports page
    When I click on the bar chart button
    And I choose to view a bar chart for some specific skills or topics
    Then I should be able to view a bar chart for the selected skills and topics
