module Sudoku
  class Solve
    def initialize (board)
      @starting_board = Board.new(board.stream)
      @solution       = Board.new(board.stream)
    end
    
    def complete
      until @game.find_naked_single == nil
        x = @game.find_naked_single
        @game.solve(x)
      end
    end
  end

end