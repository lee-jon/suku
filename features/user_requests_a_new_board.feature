Feature: start a board at the command line

  As a developer
  I want to start a game
  So that I can access a board

  Scenario: start game board
  :x
    Given the libraries are loaded
    When I request a new board
    Then a new blank board is generated

  Scenario: start board and fill in the cells
    Given the libraries are loaded
    When I request a board with a input of cells
    Then the board's cells are filled with my input
