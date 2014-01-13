require File.join(File.dirname(__FILE__), "/../spec_helper")

module Sudoku
  describe Logical do

    describe "find naked single" do
      before(:each) do
        @board = Sudoku::Puzzle.new ("123456789" + ("000000000"*8))
        @solution = Logical.new (@board)
      end
      it "should not find any in a blank board" do
        @solution.find_naked_single.should be_nil
      end
      it "should find a naked single when analysed" do
        @board.set [5,0], 0
        @solution.find_naked_single.should_not be_empty
      end
      it "should fill the board with naked singles when instruted" do
        @board.set [5,0], 0
        possibilities = @solution.find_naked_single
        @solution.solve(possibilities)
        @solution.find_naked_single.should be_nil
      end
    end

    describe "find hidden single" do
      before(:each) do
        @board = Sudoku::Puzzle.new
        @solution = Logical.new(@board)
      end
      it "should not find any hidden singles" do
        @solution.find_hidden_single.should be_nil
      end
      it "should find a hidden single when there is one" do
        # Set a hidden single of "2" on coordinate 0,0
        @board.set [1,3], 2
        @board.set [2,6], 2
        @board.set [3,1], 2
        @board.set [6,2], 2

        @solution.find_hidden_single.should_not be_empty
      end
    end

    describe "find naked pair" do
      before (:each) do
        @board    = Sudoku::Puzzle.new
        @solution = Logical.new(@board)
      end

      it "should not find any naked pairs" do
        @solution.find_naked_pair.should be_nil
      end

      it "should find a naked pair when there is one" do
        string = "023456009" + "700000110" + "000000000" * 7
        @board    = Sudoku::Puzzle.new(string)
        @solution = Logical.new(@board)

        @solution.find_naked_pair.should_not be_empty
      end
    end

  end
end
