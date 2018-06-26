Feature: Adding students to a school
  In order to have my students play on Sumdog
  As a teacher
  I want to be able to add students to my school

  Scenario: I should be able to navigate to the students page, try to add a student, and then cancel
    Given I am signed in as a teacher with a school
    And I am on the teacher dashboard
    When I navigate to the students page
    Then I should be on the students page
    When I click to add a student to the current class
    Then I can see the add student menu
    And I should be able to close the add student menu

  Scenario: Trying to add a student with no first name
    Given I am signed in as a teacher with a school
    When I navigate to the add student menu
    And I try to add a student with a blank first name
    Then the add student menu should still be there
    And the invalid first name error message should show
    And a student should not be added

  Scenario: Adding a student with no class selected
    Given I am signed in as a teacher with a school
    And I navigate to the add student menu
    When I try to add a student with valid details but I do not choose a class
    Then I should be back on the students page
    And the created student should not belong to any class
