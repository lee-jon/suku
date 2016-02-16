# Data Structure

## Board structure
The board is arranged in a array of 9 arrays. Each array having 9 postions. This is mapped in the following way. The first dimension is a row. With the top row being array[0] and the bottom row array[8]. The first column in hence array[(0..8)][0] and the last column is array[(0..8)][8].

A row or column can be called, read-only, from the Board class using the `.row(index)` or `.column(index)` methods.

### Box structure
The nine boxes are given the index.

    |0|1|2|
    |3|4|5|
    |6|7|8|

the cells within those boxes are given the same index. Because of the use of arrays, a box can be called with the `.box(index)` method or by passing through the coordinates of a cell, which will find the correct box index using `.box(x,y)`

### Coordinates
For cell manipulation (setting or getting) a pseudo-cartesian grid is used, with the origin as the top-left cell. The x axis is denoted 0..8 and the y axis similarly 0..8 (not in negatives!). Calling coordinates is in the opposite order to calling directly from the array

For example, in an array the last cell of the top row would be `array[0][8]` but in coordinates this would be cell(8,0).


# Data Structure

## Board Structure
The board is arranged in a array of 9 arrays. Each array having 9 postions. Positions can be accessed by reading the whole array, a row, a column or a box (box numbers shown in the centre of the 3x3 grids). In standard with the Sudoku solving community a board can be shown as:

```
  -------------
A |...|...|...|
B |...|...|...|
C |...|...|...|
  +---+---+---+
D |...|...|...|
E |...|...|...|
F |...|...|...|
  +---+---+---+
G |...|...|...|
H |...|...|...|
I |...|...|...|
  -------------
   123 456 789
```

Each point in represented in a 2D array
