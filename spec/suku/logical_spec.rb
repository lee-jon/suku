require File.join(File.dirname(__FILE__), "/../spec_helper")

# Logical module contains logic solvers which interact with the Board class

module Logical
  include Sudoku

    describe "naked single" do
      it "should not find them in a blank board" do
        solution = Board.new
        solution.naked_singles.should be_empty
      end
      it "should find a hidden single when analysed" do
        solution = Board.new ("123450789" + ("000000000"*8))
        solution.naked_singles.should_not be_empty
      end
      it "should fill the board with hidden singles" do
        possibilities = solution.naked_singles
        solution.solve(possibilities).should include("123456789")
      end
    end

  end
end
