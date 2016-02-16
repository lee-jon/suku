Feature: user checks board for validity

  As a user
  I want to know when an entered cell is invalid
  So that I do not progress with the puzzle before correcting the cell

  Scenario Outline: Entering a valid cell
    Given a valid puzzle is active
    When I enter <value> in the cell at <coords>
    Then the validity response should be <resp>

    Scenarios: entering a valid number
      | value | coords | resp  |
      | 1     | [0,1]  | true  |
      | 4     | [0,0]  | true  |
      | 3     | [8,8]  | true  |
      | 8     | [1,7]  | true  |
      | 8     | [3,8]  | true  |

    Scenarios: entering an invalid number
      | value | coords | resp  |
      | 9     | [0,0]  | false |
      | 9     | [8,8]  | false |
      | 2     | [8,8]  | false |
      | 7     | [7,7]  | false |
      | 5     | [4,3]  | false |

