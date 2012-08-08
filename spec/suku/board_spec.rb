require File.join(File.dirname(__FILE__), "/../spec_helper")

module Sudoku
  describe Board do

    context "starting up" do
      describe "with no input" do
        it "should create a blank board" do
          game = Board.new
          game.stream.should eq("0"*81)
        end
      end

      describe "with a valid string input" do
        it "should create a valid board" do
          game = Board.new("123456789"*9)
          game.stream.should eq("123456789"*9)
        end
      end

      describe "with an invalid input" do
        it "should not create a game if the characters are not 81 in length" do
          lambda { Board.new("123") }.should raise_error(ArgumentError)
        end
      end
    end

    context "viewing the board" do
      before(:each) do
        @game = Board.new
      end

      describe "by requesting a string" do
        it "should output a string of 81 characters" do
          @game.should respond_to(:stream)
          @game.stream.should have(81).characters
        end
      end

      describe "by requesting a board view on standard out" do
        it "should output to STDOUT" do
          @game.should respond_to(:show)
        end
      end
    end

  end
end
