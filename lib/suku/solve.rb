module Sudoku
  class Solve
    def initialize (logical)
      @game = logical
      # currently this is wierd, but Solve could call new instances of
      # Board and the logical algorithm
    end
    
    def complete
      until @game.find_naked_singles == nil
        x = @game.find_naked_singles
        @game.solve(x)
      end
    end
  end

end
