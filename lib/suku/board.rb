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
        x = []; input.each_char { |char| x << char }
        (0..8).each do |row|
          temp_row = []
          (0..8).each do |col|
            temp_row[col] = x.shift
          end
          @grid[row] = temp_row
        end
      end
    end

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
    end

  end
end
