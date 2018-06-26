@WIP
Feature: Entering and playing in a contest
  In order to compete in a contest
  As a teacher
  I want to join a contest
  And have my students play in the contest

 
  Scenario: Contests tab redirects to the correct page
    Given I am signed in as a teacher with a school
    And I am on the teacher dashboard
    When I click on the contests tab
    Then I should be on the contests page

  @fast_sanity
  Scenario: Enter a national contest
    Given I am signed in as a teacher who is not in a contest
    And I am on the contest page
    When I enter a national contest without adding students
    Then I should be warned that not all my students are in the contest
    And I should be in a contest

  Scenario: Try to leave a contest
    Given I am signed in as a teacher who is in a national contest
    And I am on the contest page
    When I try to leave the contest
    But cancel at confirmation
    Then I should be in a contest

  Scenario: A student cannot set skills while in a contest
    Given I am signed in as a student in a contest
    And I am on the hangout
    When I click on the skills panel
    Then I should not be able to choose any skills

  Scenario: A student cannot set a topic while in a contest
    Given I am signed in as a student in a contest
    And I am on the hangout
    Then I should see the number of questions I have yet to answer
    But I should not see the topic panel

  Scenario: A student can play a game while in a contest
    Given I am signed in as a student in a contest
    And I am on the hangout
    When I click on my avatar
    Then the game should work as expected

  @fast_sanity
  Scenario: After a student has played a game the contest score should update
    Given I am signed in as a teacher with a student who has played in a live contest
    And I am on the teacher contests page
    When I click on the report link in students
    Then I should see a table with one row

  Scenario: Add a newly created student to contest
    Given I am signed in as a teacher who is in a contest
    And I am on the manage students page
    When I add a student who will be added to contests automatically
    And I go to the contests page
    Then I should have more students entered in the contest

  Scenario: Add an existing student to contest
    Given I am signed in as a teacher who is in a contest with no students entered
    And I am on the contests page
    When I add all students to the contest
    Then I should have more students entered in the contest
	
  @fast_sanity
  Scenario: teachers can view the leaderboard for a contest
    Given I am signed in as a teacher
    And I am on the contests page
    When I click on the number of classes that have been entered in a contest
    Then I should be redirected to the leaderboard for that contest

  @fast_sanity
  Scenario: students can view the leaderboard for a contest
    Given I am signed in as a student who is in a contest
    And I am on the hangout
    When I click on the contests' name
    And I click on the top ten students button
    Then I should see a table of the top ten students in the contest

