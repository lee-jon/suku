module Sudoku

  unless const_defined?(:VERSION)
    VERSION = '0.1.0'
  end

end


require 'suku/board'
require 'suku/solve_by_brute_force'
