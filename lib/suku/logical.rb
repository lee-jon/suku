module Sudoku
  module Logical

    def naked_singles
      response = []
      (0..8).each do |r|
        (0..8).each do |c|
          if self.allowed[r][c].size == 1 && self.allowed[r][c] != 0
            response << [[c,r], self.allowed[r][c].to_i, "naked single"]
          end
        end
      end
      return response
    end

    def solve cells
      cells.each_index do |i|
        set cells[i][0], cells[i][1]
      end
    end
  end
end
