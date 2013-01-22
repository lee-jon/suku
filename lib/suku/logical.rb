module Sudoku
  class Logical
    # Each method returns a verbose array. This can be passed to solve to
    # set the cells from the response.
    #
    # Three boards are used in calculating the solutions
    # @board     => target board
    # @reference => original for reference in solving
    # @allowed   => board for manipulating allowed values
    #
    # response format is always of the type
    # [ [ [coords], solved value, type ], [...], [...]]

    def initialize input_board
      @board     = input_board
      @reference = input_board.stream
      @allowed   = Board.new(input_board.allowed)
    end

    # method solves cells based on the response from the detectors
    def solve cells
      cells.each_index do |i|
        @board.set cells[i][0], cells[i][1]
      end

      regenerate
    end

    # finds cells where there is no other possibility except one number
    def find_naked_single
      regenerate

      response = []
      (0..8).each do |r|
        (0..8).each do |c|
          if @allowed.get([r, c]).size == 1 && @allowed.get([r, c]) != 0
            response << [[r, c], @allowed.get([r, c]).to_i, "naked single"]
          end
        end
      end
      return response unless response.empty?
    end

    # finds cells where there is are multiple possibilties, but only one number
    # is possible
    def find_hidden_single
      regenerate

      response = []
      (0..8).each do |r|
        (0..8).each do |c|
          if @allowed.get([r, c]).size != 1 && @allowed.get([r,c]) != 0
            @allowed.get([r, c]).scan(/./).each do |value|
              detection = false
              # TODO cast array to long string and count the numbers
              detection = true if @allowed.row(r).to_s.count(value.to_s) == 1
              detection = true if @allowed.column(c).to_s.count(value.to_s) == 1
              detection = true if @allowed.box([r,c]).to_s.count(value.to_s) == 1
              if detection == true
                response << [[c,r], value, "hidden single"]
              end
            end
          end
        end
      end
      return response unless response.empty?
    end

    private
     def regenerate
       @allowed = Board.new(@board.allowed)
     end
  end
end
