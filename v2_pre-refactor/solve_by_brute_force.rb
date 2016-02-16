# Brute Force Algorithm for solving Sudoku puzzles
#
# Searches entire space and worst case is very inefficient.
# Unlike some methods this algorithm will always find a solution.

module Solvers
  def solve_by_brute_force
    blanks = self.blanks
    pos = 0

    while pos < blanks.size
      set(blanks[pos], (get(blanks[pos]) + 1))
      next unless valid? == true
      if get(blanks[pos]) > 9
        set(blanks[pos], 0)
        pos -= 1
      else
        pos += 1
      end
    end
  end
end
