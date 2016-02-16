module Sudoku
  class Board
    def initialize(input = nil)

      if input.class == String
        raise ArgumentError.new("Invalid number of characters in String input") unless input.length == 81

        @grid = Array.new(9)

        x = []; input.each_char { |char| x << char.to_i }
        (0..8).each do |row|
          temp_row = []
          (0..8).each do |col|
            temp_row[col] = x.shift
          end
          @grid[row] = temp_row
        end

      elsif input.class == Array
        raise ArgumentError.new("Incorrect array size") unless input.size == 9

        @grid = input

      elsif input.class == NilClass
        @grid = generate_blank

      else
        raise ArgumentError.new("Invalid input")
      end
    end

    ################################################
    # Getting elements from a board
    #
    def stream
      @grid.join
    end

    def get(coords)
      @grid[coords[1]][coords[0]]
    end

    def set(coords, value)
      @grid[coords[1]][coords[0]] = value
    end

    def row(index)
      @grid[index]
    end

    def column(index)
      column = []
      (0..8).each do |i|
        column << @grid[i][index]
      end
      column
    end

    def box(index)
      if index.class == Fixnum
        return boxes[index]
      elsif index.class == Array
        x = index[0]
        y = index[1]
        calculated = if x < 3
                       0
                     elsif x < 6
                       1
                     else
                       2
                     end
        calculated += if y < 3
                        0
                      elsif y < 6
                        3
                      else
                        6
                      end
        return boxes[calculated]
      end
    end

    private

    def boxes
      corner = [0, 3, 6]
      cell_view = []
      cell_index = 0

      corner.each do |r|
        corner.each do |c|
          cell_view[cell_index] = [@grid[r][c], @grid[r][c + 1], @grid[r][c + 2], @grid[r + 1][c], @grid[r + 1][c + 1], @grid[r + 1][c + 2], @grid[r + 2][c], @grid[r + 2][c + 1], @grid[r + 2][c + 2]]
          cell_index += 1
        end
      end

      cell_view
    end

    def generate_blank
      Array.new(9).map { |_i| [0, 0, 0, 0, 0, 0, 0, 0, 0] }
    end
  end
end
