require File.join(File.dirname(__FILE__), "/../spec_helper")

# Board class tests uses blank or sample board shown:
# x 012   345   678
# y
# 0  009 | 730 | 526
# 1  005 | 020 | 800
# 2  608 | 000 | 047
#   ----+-----+----
# 3  000 | 009 | 062
# 4  040 | 603 | 080
# 5  890 | 500 | 000
#   ----+-----+----
# 6  260 | 000 | 108
# 7  007 | 010 | 600
# 8  951 | 064 | 200

module Sudoku
  describe Board do
    context "starting up" do
      describe "with no input" do
        it "should create a blank board" do
          game = Board.new
          game.stream.should eq("0" * 81)
        end
      end

      describe "with a valid string input" do
        it "should create a valid board" do
          game = Board.new("123456789" * 9)
          game.stream.should eq("123456789" * 9)
        end
      end

      describe "with an invalid input" do
        it "should not create a game if the characters are not 81 in length" do
          -> { Board.new("123") }.should raise_error(ArgumentError)
        end
      end

      describe "with a valid array input" do
        it "should not create a game if the input isn't a [9][9] array" do
          -> { Board.new([1, [2, 2]]) }.should raise_error(ArgumentError)
        end
      end
    end

    context "viewing a board" do
      before(:each) do
        @sample_board = "009730526005020800608000047000009062040603080890500000260000108007010600951064200"
        @game = Board.new @sample_board
      end

      describe "by requesting a string output" do
        it "should output a string of 81 characters" do
          @game.should respond_to(:stream)
          @game.stream.should have(81).characters
        end
      end

      describe "by looking at each element:" do
        describe '#rows' do
          it "returns the correct row as an array" do
            result = @game.row(0)
            result.should eq([0, 0, 9, 7, 3, 0, 5, 2, 6])
          end
        end
        describe '#column' do
          it "returns the correct column as an array" do
            result = @game.column(0)
            result.should eq([0, 0, 6, 0, 0, 8, 2, 0, 9])
          end
        end
        describe '#box' do
          it "returns the correct grid box if given an index" do
            result = @game.box(0)
            result.should eq([0, 0, 9, 0, 0, 5, 6, 0, 8])
          end
          it "returns the correct box from a cell's coordinate" do
            result = @game.box [0, 0]
            result.should eq([0, 0, 9, 0, 0, 5, 6, 0, 8])
          end
        end
      end # of each element
    end # of viewing the board
  end # of Board
end
