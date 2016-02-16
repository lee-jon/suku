Feature: start a board at the command line

  As a developer
  I want to start a game
  So that I can access a board

  Scenario: start game board
    Given the libraries are loaded
    When I request a new board
    Then a new blank board is generated

  Scenario: start board and fill in the cells
    Given the libraries are loaded
    When I request a board with a input of cells
    Then the boards cells are filled with my input
