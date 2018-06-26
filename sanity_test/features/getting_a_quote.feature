@quotes
@email
Feature: Getting a quote
  I want to request a quote
  As a teacher
  In order to find out the price of subscribing my students

  Scenario: Navigating to the get a quote page
    Given I am signed in as a teacher with a school
    And I am on the subscription page
    When I click on the request a quote button
    Then I should be on the get a quote page
    And the quote for field should read "A new subscription"

  Scenario: Getting a maths subscription quote
    Given I am signed in as a teacher with a school
    And I am on the get a quote page
    When I order a maths quote
    Then I should be taken to the quote summary page
    And I should receive an email with the details of the quote

  Scenario: Getting a maths, reading and writing subscription quote
    Given I am signed in as a teacher with a school
    And I am on the get a quote page
    When I order a maths, reading and writing quote
    Then I should be taken to the quote summary page
    And I should receive an email with the details of the quote

  Scenario: Entering an invalid email address
    Given I am signed in as a teacher with a school
    And I am on the get a quote page
    When I order a quote with an invalid email address
    Then I should receive an error message saying "Notification email is invalid"
    And I should still be on the get a quote page

  Scenario: Entering an invalid date
    Given I am signed in as a teacher with a school
    And I am on the get a quote page
    When I order a quote with an invalid date
    Then I should receive an error message saying "Ends on must be later than..."
    And I should still be on the get a quote page

  Scenario: Entering an invalid number of student places on a new quote
    Given I am signed in as a teacher with a school
    And I am on the get a quote page
    When I order a quote with an invalid number of student places
    Then I should receive an error message saying "Please make sure you have added students for at least one subject"
    And I should still be on the get a quote page
    
  Scenario: Entering an invalid number of student places on an extension quote
    Given I am signed in as a teacher with a subscription
    And I am on the get a quote page
    When I order an extension quote with an invalid number of student places
    Then I should receive an error message saying "must select at least..."
    And I should still be on the get a quote page

  Scenario: Getting a subscription extension quote
    Given I am signed in as a teacher with a school with a current subscription
    And I am on the get a quote page
    Then the quote for field should read "Extending your current subscription"
    When I order an extension quote
    Then I should be taken to the quote summary page
    And I should receive an email with the details of the extension quote