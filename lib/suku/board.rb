module Sudoku
  class Board
    def initialize(input=nil)
      if input.nil?
        @grid = Array.new
        (0..8).each do |i|
          @grid[i] = [0,0,0,0,0,0,0,0,0]
        end

      else #convert an input string
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
  end
end
