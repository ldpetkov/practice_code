@school
Feature: creating a new school
  In order to add classes and students
  As a teacher whose school is not on Sumdog
  I want to create a new school
  
  Scenario: Entering an incorrect US zip code should return an error
    Given I am signed in as a teacher without a school
    And I choose to create or join a school
    When I submit the form with a zip code containing letters
    Then I should be warned to only enter numbers

  Scenario: Entering an existing UK postcode should return results
    Given I am signed in as a teacher without a school
    And I choose to create or join a school
    When I search the UK for the Sumdog office postcode
    Then I should see some results

  Scenario: Entering a new UK postcode and leaving fields blank on advanced search page returns an error
    Given I am signed in as a teacher without a school
    And I choose to create or join a school
    When I search for a UK postcode which returns no results
    And I do not enter any additional information on the advanced search page
    Then I should be asked to fill in required fields

  Scenario: Performing an advanced search returns results
    Given I am signed in as a teacher without a school
    And I go to the advanced search page
    When I search for crocodile school with the UK Sumdog office address
    Then I should see some results

  Scenario: Not entering a home nation on the school creation page
    Given I am signed in as a teacher without a school
    And I go to the advanced search page
    When I search for a school that does not exist
    And I try to set up a new school without entering a home nation
    Then I should be asked to enter a home nation

  Scenario: Creating a new school
    Given I am signed in as a teacher without a school
    And I go to the advanced search page
    And I search for some terms which provide no results
    When I set up a new school with all of the required information
    Then I should be in a school