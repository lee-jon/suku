# Suku [![Gem Version](https://badge.fury.io/rb/suku.png)](http://badge.fury.io/rb/suku)
The sudoku library - a war on 9x9 grids.

by [Lee-Jon](https://github.com/lee-jon)

## Goal
My aim in creating Suku is creating a ruby library for manipulating, generating and solving Sudoku games.

## Classes
`Board` encapsulates the rules of a sudoku board
`Puzzle` encapsulates the puzzle
`Printer` makes a nice board in `irb` or similar

## Solving a sudoku
Currently the solver uses constraint propagation, eliminating potential values based on constrainst. This is done in two ways:

1. If a value is assigned to a square, no other peer of that square is allowed to have that value.
2. If a value can only appear once in a unit(row, column, box) then it is assigned to that square.

Assignment of any value recursively propagates throughout the grid. Almost all easy sudoku's are solvable. Sample sudoku data is provided in the source data folder

Usage:

```ruby
puzzle = Puzzle.new
puzzle.parse_grid("..3.2.6..9..3.5..1..18.64....81.29..7.......8..67.82....26.95..8..2.3..9..5.1.3..")

puts Printer.parse(puzzle)

# output:
4 8 3 |9 2 1 |6 5 7
9 6 7 |3 4 5 |8 2 1
2 5 1 |8 7 6 |4 9 3
------+------+------
5 4 8 |1 3 2 |9 7 6
7 2 9 |5 6 4 |1 3 8
1 3 6 |7 9 8 |2 4 5
------+------+------
3 7 2 |6 8 9 |5 1 4
8 1 4 |2 5 3 |7 6 9
6 9 5 |4 1 7 |3 8 2
```

## Help out!
I'm not a programmer by profession, only for fun. So any advice on how to refactor, structure or code is welcomed!
