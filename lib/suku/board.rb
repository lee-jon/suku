module Sudoku
  class Board
    def initialize(input=nil)

      if input.nil?
        @grid = Array.new
        (0..8).each do |i|
          @grid[i] = [0,0,0,0,0,0,0,0,0]
        end

      else #convert an input string
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
      end
    end

    #Getting elements from a board
    def get coords
      @grid[coords[1]][coords[0]]
    end

    def set (coords, value)
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
      return column
    end

    def box(index)
      if index.class == Fixnum
        return boxes[index]
      elsif index.class == Array
        x = index[0]
        y = index[1]
        if x < 3
          calculated = 0
        elsif x < 6
          calculated = 1
        else
          calculated = 2
        end
        if y < 3
          calculated += 0
        elsif y < 6
          calculated += 3
        else
          calculated += 6
        end
        return boxes[calculated]
      end
    end

    #getting the entire board
    def stream
      @grid.join
    end

    def show
      response = ""
      (0..8).each do |i|
        response += "#{@grid[i][0]} #{@grid[i][1]} #{@grid[i][2]} | #{@grid[i][3]} #{@grid[i][4]} #{@grid[i][5]} | #{@grid[i][6]} #{@grid[i][7]} #{@grid[i][8]}\n".gsub("0", ".")
        if i == 2 || i == 5
          response += "------+-------+------\n"
        end
      end

      return response
    end

    private

    def boxes
      corner = [0,3,6]
      cell_view = []
      cell_index = 0

      corner.each do |r|
        corner.each do |c|
          cell_view[cell_index] = [@grid[r][c],@grid[r][c+1],@grid[r][c+2],@grid[r+1][c],@grid[r+1][c+1],@grid[r+1][c+2],@grid[r+2][c],@grid[r+2][c+1],@grid[r+2][c+2] ]
          cell_index += 1
        end
      end
      return cell_view
    end


  end
end