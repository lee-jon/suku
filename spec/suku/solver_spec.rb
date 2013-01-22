require File.join(File.dirname(__FILE__), "/../spec_helper")

module Sudoku
=begin
  describe Solve do

    before(:each) do
      @sample_board    = "009730526005020800608000047" +
                         "000009062040603080890500000" +
                         "260000108007010600951064200"
      @sample_solution = "419738526735426819628951347" +
                         "573189462142673985896542731" +
                         "264397158387215694951864273"
      @board   = Board.new @sample_board
      @logical = Logical.new @board
    end

    describe "should solve a simple sudoku with only singles" do
      # @game = Solve.new @logical
      # @game.complete
      # @board.stream.should eq(@sample_solution)
    end

  end
=end
end
