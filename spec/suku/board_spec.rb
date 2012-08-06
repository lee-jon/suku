require File.join(File.dirname(__FILE__), "/../spec_helper")

module Sudoku
  describe Board do
    context "starting up" do
      it "with no input a blank board is created" do
        game = Board.new
        game.stream.should include("0"*81)
      end
    end

  end
end
