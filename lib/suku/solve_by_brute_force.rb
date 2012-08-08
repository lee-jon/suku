# Brute Force Algorithm for solving Sudoku puzzles
#
# Searches entire space and worst case is very inefficient.
# Unlike some methods this algorithm will always find a solution.

module Solvers

  def solve_by_brute_force
    blanks, pos = self.blanks, 0

    while pos < blanks.size
      self.set(blanks[pos], (self.get(blanks[pos])+1))
      if self.is_valid? == true
        if self.get(blanks[pos]) > 9
          self.set(blanks[pos], 0)
          pos -= 1
        else
          pos += 1
        end
      end
    end

  end

end
