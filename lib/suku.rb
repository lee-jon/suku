module Sudoku

  unless const_defined?(:VERSION)
    VERSION = '0.2.0'
  end

end

require 'suku/board'
require 'suku/puzzle'
require 'suku/logical'
