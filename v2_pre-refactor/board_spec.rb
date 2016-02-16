require File.join(File.dirname(__FILE__), "/../spec_helper")

RSpec.describe Sudoku::Board do

  context "A new board" do
    let(:valid_string)   { "0" * 81 }
    let(:valid_string2)  { "123" * (81 / 3) }

    let(:invalid_string) { "hi" }

    let(:blank_grid) { [[0, 0, 0, 0, 0, 0, 0, 0, 0]] * 9 }
    let(:valid_grid) { [[1, 2, 3, 1, 2, 3, 1, 2, 3]] * 9 }

    let(:board) { Sudoku::Board.new }

    describe "with no input" do
      it "should create a new board instance" do
        -> { Sudoku::Board.new }.should_not raise_error
      end

      it "should create a 9x9 blank grid" do
        expect(board.grid.flatten.uniq).to eq([0])
        expect(board.grid).to eq(blank_grid)
      end
    end

    describe "with a input string of the wrong size" do
      it "should raise an error" do
        -> { Sudoku::Board.new(invalid_string) }.should raise_error(ArgumentError)
      end
    end

    describe "with a string of 81 characters" do
      let(:blank_board) { Sudoku::Board.new(valid_string) }

      it "should create a 9x9 blank grid" do
        expect(blank_board.grid).to eq(blank_grid)
      end
    end

    describe "with a string of 123s" do
      let(:string_board) { Sudoku::Board.new(valid_string2) }

      it "should create a 9x9 blank grid" do
        expect(string_board.grid).to eq(valid_grid)
      end
    end
  end

  context "viewing a board" do
  end
end
