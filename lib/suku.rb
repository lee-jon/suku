module Sudoku

  unless const_defined?(:VERSION)
    VERSION = '0.1.2'
  end

end

require 'suku/board'
require 'suku/logical'
#require 'suku/solve'
#require 'suku/solve_by_brute_force'
