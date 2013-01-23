# Suku [![Gem Version](https://badge.fury.io/rb/suku.png)](http://badge.fury.io/rb/suku)
The sudoku library - a war on 9x9 grids.

by [Lee-Jon](https://github.com/lee-jon)

## Goal
My aim in creating Suku is creating a ruby library for manipulating, generating and solving Sudoku games.

At present version 0.1, this is a learning exercise, so code can be badly factored and is often without tests - and some code is more exploratory and unoptimised. The aim is to get basic board manipulation done before moving on to brute-force, backtracing, and then the basic logical solvers.

Once this is completed 0.2+ will create a game loop, and solving loop to incrementally solve any Sudoku puzzle.

To do will be Sudoku puzzle generation, and the more advanced logic solvers.

## Features
Currently there are two classes:

* Board   - which encapsulates a 9x9 grid
* Logical - which encapsulates all the logic methods to solve a board

Also included is solve\_by\_brute\_force.rb, which is a brute force algorithm.

## Help out!
I'm not a programmer by profession, only for fun. So any advice on how to refactor, structure or code is welcomed!
