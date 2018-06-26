@fast_sanity_full
Feature: Using Sumdog
  In order check fast sanity
  As a user
  I want to be able to use the site
  
  @guest_signin
  Scenario: Can log in as a guest
    Given I am on the homepage
    When I click on Try Sumdog! link
    Then I should be on the city
    And I am in Find Level phase
    Then I should be able to play Junk Pile

  @teacher_house
  Scenario: Teacher should be able to check house
    Given I am signed in as a teacher with automated sanity condition
    When I click on Play link
    And I click on house panel
    Then I should be on the house
    And I can see the avatar

  @teacher_clothes
  Scenario: Teacher should be able to change, equip and remove items
    Given I am signed in as a teacher with automated sanity condition
    And I am on the house
    When I click on wardrobe panel
    Then I should be able to equip, change and remove clothes

  @teacher_store
  Scenario: Teacher can buy items in store
    Given I am signed in as a teacher with automated sanity condition
    And I am on the house
    When I click on store panel
    And I click on departments panel
    And I click on House link
    And I click on categories panel
    And I click on Furniture link
    Then I can buy and sell an item with 100 coins deducted and 80 coins refunded

  @student_select_skills
  Scenario: Student can select skills and see example questions
    Given I am signed in as a student with automated sanity condition
    When I click on activities panel
    And I click on Training link
    Then I should be in the Training activity
    And I open progression status
    And I click on Choose skills button
    Then I can select a skill and view example questions
    And I should be able to play Kiteboarding
    Then I am not signed in

  @teacher_writing
  Scenario: Can restrict students to writing and students can play writing games
    Given I am signed in as a teacher with automated sanity condition
    When I restrict students to writing
    And I am signed in as a student with automated sanity condition
    And I change subject to writing
    Then I should be able to play Lies
    When I am signed in as a teacher with automated sanity condition
    Then I remove subject restriction

  @teacher_contest
  Scenario: Can check contest data, students can participate in contest activity
    Given I am signed in as a teacher with automated sanity condition
    And I am in a contest
    When I am signed in as a student with automated sanity condition
    And I select contest activity
    Then I should be able to play Talent Show

  @teacher_reports
  Scenario: Generate reports as a teacher
    Given I am signed in as a teacher with automated sanity condition
    Then I should be able to generate a report

  @teacher_create_assessment
  Scenario: Teacher can create an assessment
    Given I am signed in as a teacher with automated sanity condition
    Then I should be able to create a new assessment

  @student_assessment
  Scenario: Student should be able to participate in an assessment
    Given I am signed in as a student with automated sanity condition
    Then I should be in the AUTOMATED-FAST-SANITY activity
    And I should be able to do the assessment
    Then I should see assessment results

  @teacher_assessment_results
  Scenario: Teacher should be able to see assessment results
    Given I am signed in as a teacher with automated sanity condition
    When I click on Assessments panel
    And I click on View assessments link
    And I open results for last assessment
    Then I should see assessment results for Student One

  @teacher_proficiency
  Scenario: Teacher should see student proficiency
    Given I am signed in as a teacher with automated sanity condition
    When I select math subject
    And I click on Done button
    When I open proficiency chart
    Then I should see proficiency chart
    And I should be able to hide and show Student One data
