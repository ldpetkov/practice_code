@writing_games
@live_classes
@Sikuli


Feature: Students should be able to play writing games
  In order to improve my writing skills
  As a student
  I want to play Sumdog's writing games

  @fast_sanity
  Scenario: All students can play candy
    Given I am signed in as a student who does not have a writing subscription
    When I change my subject to writing
    And I choose to play candy
    Then I should start looking for players
  
  Scenario: Students cannot play writing games without a subscription
    Given I am signed in as a student who does not have a writing subscription
    When I change subject to writing
    And I choose to play Secret
    Then I should be notified that Secret is a premium game

  @fast_sanity
  Scenario: Subscribed students with permission can play chat games
    Given I am signed in as a teacher with a subscription
    And I have allowed students to play writing games
    And I am signed in as a subscribed student with full writing permissions
    When the teacher chooses to play Secret
    And the student chooses to play Secret
    Then a game of Secret should start for the teacher
    And a game of Secret should start for the student

  Scenario: Students cannot write a rude word in chat games
    Given I am signed in as a teacher with a subscription
    And I have an active Writing training live class
    And I am signed in as a subscribed student with full writing permissions
    When the teacher chooses to play Secret
    And the student chooses to play Secret
    When the teacher types a rude word
    Then they should see a message warning them

  Scenario: Spelling mistakes are corrected in chat games
    Given I am signed in as a teacher with a subscription
    And I have an active Writing training live class
    And I am signed in as a subscribed student with full writing permissions
    When the teacher chooses to play Secret
    And the student chooses to play Secret
    When the teacher makes a spelling mistake
    Then they should be given a list of corrections to choose from
