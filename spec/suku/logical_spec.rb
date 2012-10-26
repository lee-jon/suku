require File.join(File.dirname(__FILE__), "/../spec_helper")

# Logical module contains logic solvers which interact with the Board class

module Sudoku
  describe Logical do

    describe "naked single finder" do
      before(:each) do
        @board = Sudoku::Board.new ("123456789" + ("000000000"*8))
        @solution = Logical.new (@board)
      end
      it "should not find any in a blank board" do
        @solution.find_naked_singles.should be_nil
      end
      it "should find a hidden single when analysed" do
        @board.set [5,0], 0
        @solution.find_naked_singles.should_not be_empty
      end
      it "should fill the board with hidden singles when instruted" do
        @board.set [5,0], 0
        possibilities = @solution.find_naked_singles
        @solution.solve(possibilities)
        @solution.find_naked_singles.should be_nil
      end
    end

  end
end
