@fast_sanity
@setting_skills
@WIP

Feature: Setting skills as a teacher
  In order to limit certain topics
  As a fast sanity teacher
  I want to restrict certain default skills

  Scenario: Signing in as a teacher on the homepage using global username
    Given I am on the homepage
    When I sign in on the homepage as a teacher using a global username
    Then I should be signed in

  Scenario: Setting default skills to a subset of the skills
    Given I am on the teacher dashboard
    And I am using common core maths standards
    When I select all students from a class at the school
    And I restrict their maths topics to make the number, add, subtract, maths_word_problems, and geometry topics unavailable
    Then I should see the topics restricted
