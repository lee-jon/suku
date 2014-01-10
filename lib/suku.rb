module Sudoku

  unless const_defined?(:VERSION)
    VERSION = '0.1.3'
  end

end

require 'suku/board'
require 'suku/puzzle'
require 'suku/logical'