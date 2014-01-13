module Sudoku
  class Logical
    # Each method returns a verbose array. This can be passed to solve to
    # set the cells from the response.
    #
    # Three boards are used in calculating the solutions
    # @board     => target puzzle
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

    # Public: finds cells where there is no other possibility except one number
    #
    # Returns array of naked singles
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

    # Public: Looks for cell in a row, column or box where there is only one
    # possibilty. See http://angusj.com/sudoku/hints.php - hidden single.
    #
    # Returns array of hidden singles
    def find_hidden_single
      regenerate

      response = []
      (0..8).each do |r|
        (0..8).each do |c|
          if @allowed.get([r, c]).size != 1 && @allowed.get([r,c]) != 0
            @allowed.get([r, c]).scan(/./).each do |value|
              detection = false
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
    
    # Public: Looks in each row for a naked pair
    #
    # Returns array of naked pairs
    def find_naked_pair
      response = []
      (0..8).each do |i|
        # in row i
        array = @allowed.row (i)
        array.delete(0)
        # find the unique 2 letter codes
        array.uniq.select { |cell| cell.length == 2 }.each do |pair|
          if array.select { |cell| cell == pair }.size == 2
            response << "#{i} row, has naked pair of #{pair}"
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
