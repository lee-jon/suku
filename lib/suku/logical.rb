module Sudoku
  class Logical
    # Each method returns a verbose array. THis can be passed to solve to
    # set the cells from the response
    #
    # response format is
    # [ [[coords], value, type], [...], [...]]

    def initialize input_board
      @board = input_board
    end

    # method solves cells based on the response from the detectors
    def solve cells
      cells.each_index do |i|
        @board.set cells[i][0], cells[i][1]
      end
    end

    # finds cells where there is no other possibility that one number
    def find_naked_single
      response = []
      (0..8).each do |r|
        (0..8).each do |c|
          if @board.allowed[r][c].size == 1 && @board.allowed[r][c] != 0
            response << [[c,r], @board.allowed[r][c].to_i, "naked single"]
          end
        end
      end
      return response unless response.empty?
    end

    def find_hidden_single
      response = []

      (0..8).each do |r|
        (0..8).each do |c|
# NOT WORKING. Board is checking rows and columns instead of the allowed table!
          if @board.allowed[r][c].size != 1 && @board.allowed[r][c] != 0
            @board.allowed[r][c].scan(/./).each do |value|
              detection = false
              detection = true if @board.row(r).count(value) == 1
              detection = true if @board.column(c).count(value) == 1
              detection = true if @board.box([r,c]).count(value) == 1
              if detection == true
                response << [[c,r], value, "hidden single"]
              end
            end
          end

        end
      end

      return response unless response.empty?
    end

  end
end
