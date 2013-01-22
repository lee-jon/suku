require File.join(File.dirname(__FILE__), "/../spec_helper")

# Logical module contains logic solvers which interact with the Board class

module Sudoku
  describe Logical do

    describe "find naked single" do
      before(:each) do
        @board = Sudoku::Board.new ("123456789" + ("000000000"*8))
        @solution = Logical.new (@board)
      end
      it "should not find any in a blank board" do
        @solution.find_naked_single.should be_nil
      end
      it "should find a hidden single when analysed" do
        @board.set [5,0], 0
        @solution.find_naked_single.should_not be_empty
      end
      it "should fill the board with hidden singles when instruted" do
        @board.set [5,0], 0
        possibilities = @solution.find_naked_single
        @solution.solve(possibilities)
        @solution.find_naked_single.should be_nil
      end
    end
    
    describe "find hidden single" do
      before(:each) do
        @board = Sudoku::Board.new
        @solution = Logical.new(@board)
      end
      it "should not find any hidden singles" do
        @solution.find_hidden_single.should be_nil
      end
      it "should find a hidden single when there is one" do
        @board.set [1,3], 2
        @board.set [2,6], 2
        @board.set [3,1], 2
        @board.set [6,2], 2
        # Sets a hidden single of "2" on coordinate 0,0
        @solution.find_hidden.single.should_not be_empty
      end
    end

  end
end
