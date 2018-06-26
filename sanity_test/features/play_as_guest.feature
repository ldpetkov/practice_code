@play_as_guest
@fast_sanity

Feature: Playing a game as a guest
  In order to play without a login
  As a guest user
  I want to play a game
  
  Scenario: A guest user can play junk pile
    Given I am not signed in
    And I am on the homepage
    When I enter the 'Try me' section
    Then I should be able to play Junk Pile
    
  Scenario: A guest user can select skills
    Given I am not signed in
    And I am on the homepage
    When I enter the 'Try me' section
    Then I should be able to select a single skill

  Scenario: A guest user should not be able to enter the house
    Given I am not signed in
    And I am on the homepage
    When I enter the 'Try me' section
    Then I should be told that I cannot access the house as I am a guest


