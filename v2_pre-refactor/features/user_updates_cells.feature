Feature: user updates cells

  As a user
  I want to change values in cells
  In order to solve the puzzle

  Scenario: Getting the value from a cell
    Given a game is in progress
    When I request a cell
    Then I am given the value at that cell

  Scenario: Setting a valid value of a cell
    Given a game is in progress
    When  I pick a number
    And   That number is not one from the original puzzle
    Then  I then set the value at that cell
