@games
@student
@sikuli

Feature: Playing maths games
  In order to enjoy the site
  As a registered user
  I want to be able to play maths games.

  @fast_sanity
  Scenario: Playing an old game
    Given I am signed in as a student
    And I am on the hangout
    And Talent Show is selected
    When I start the game
    And I lose the game
    Then the endgame screen should display correctly
    When I advance to the hangout
    Then I should be taken to the hangout
    And Talent Show should be selected
  @fast_sanity
  Scenario: Playing against a robot
    Given I am signed in as a student
    And I am on the hangout
    And Street Racer is selected
    And I am playing against robots
    When I start the game
    Then I should be able to select one of the AI robots
    When the game finishes
    Then the endgame screen should display correctly
    And the AI should have finished

  Scenario: Using the in-game menu
    Given I am signed in as a student
    And I am on the hangout
    And Talent Show is selected
    When I start the game
    And I click on the arrows on the top right corner
    Then the in-game menu should come up
    And I should be able to quit the game

  @fast_sanity
  Scenario: Un-subscribed students cannot play premium games
    Given I am signed in as a student who does not have a maths subscription
    And I am on the hangout
    And bubble gum is selected
    Then I should be notified that bubble gum is a premium game
