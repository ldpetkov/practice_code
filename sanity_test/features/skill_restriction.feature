@skill_restriction
@WIP
Feature: restricting the skills that students receive questions on
  In order to customise the Sumdog curriculum
  As a teacher
  I want to set the default skills

  Scenario: Restrict maths topics for all students
    Given I am signed in as a teacher with a school
    And I am using common core maths standards
    And I am on the maths skills page
    When I choose to edit the skills of all students in the school
    And I restrict their maths topics to make the number topic unavailable
    Then the students' skills should not include skills from the number topic

  Scenario: Restrict maths levels for one student
    Given I am signed in as a teacher with a school
    And I am using common core maths standards
    And I am on the maths skills page
    When I choose to edit the skills of one student
    And I restrict maths grades to make 3rd grade unavailable
    Then their maths skills should not include skills from 3rd grade

  @fast_sanity  
  Scenario: Restrict a student to a single maths skill
    Given I am signed in as a teacher with a school
    And I am using common core maths standards
    And I am on the maths skills page
    When I choose to edit the skills of one student
    And I restrict their maths skills to square numbers
    Then the student's skills should only include square numbers

  Scenario: Restrict reading levels for a class of students
    Given I am signed in as a teacher with a subscription
    And I am on the reading skills page
    When I select all students from a class at the school
    And I restrict their reading grades to make Grade 3 unavailable
    Then their reading skills should not include skills from 3rd grade

  Scenario: Restrict maths skills for a specific student using the edit link
    Given I am signed in as a teacher with a school
    And I am using common core maths standards
    And I am on the maths skills page
    When I select all students from a class at the school
    And I click the edit button for the student at the top of the list
    And I restrict their maths topics to make the addition topic unavailable
    Then the student's skills should not include skills from the addition topic
