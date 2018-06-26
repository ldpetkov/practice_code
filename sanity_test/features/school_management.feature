@WIP

Feature: editing & updating school details
  As a teacher
  I want to manage my school's details
  So I can keep my account up to date

  Scenario: Not selecting a region returns an error
    Given I am signed in as a teacher at a school
    And I go to the region edit page                    ## /teacher/school/region/edit
    When I try to save my changes without selecting a region
    Then I should be asked to choose a region

  Scenario: Not selecting a neighbourhood returns an error
    Given I am signed in as a teacher at a school
    And I go to the region edit page
    When I try to save my changes without selecting a neighbourhood
    Then I should be asked to choose a neighbourhood      ## possibly local authority - dependent on country

  Scenario: Selecting a neighbourhood
    Given I am signed in as a teacher at a school
    And I go to the region edit page
    When I select a region and a neighbourhood
    And I go to the school page
    Then I should have the correct neighbourhood
