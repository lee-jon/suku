require File.join(File.dirname(__FILE__), "/../spec_helper")

module Sudoku
  describe Puzzle do
    
    before(:each) do
      valid_game =  "009730526" +
                    "005020800" + 
                    "608000047" + 
                    "000009062" + 
                    "040603080" + 
                    "890500000" + 
                    "260000108" + 
                    "007010600" + 
                    "951064200"
      @game = Puzzle.new valid_game
    end
    
    context "viewing a puzzle board" do
      describe "by requesting a boards view" do
        it "should output that board" do
          @game.should respond_to(:show)
        end
        it "should resemble a sudoku board in text" do
          output = @game.show
          output.should have(242).characters
          output.should include("|")
        end
      end
    end

    context "validity and violations" do
      describe "when a valid board is in use" do
        it "should return as valid" do
          @game.should be_valid
        end
      end

      describe "when a invalid cell is entered" do
        before(:each) do
          @game.set [0,0], 9
        end
        it "should not be valid" do
          @game.should_not be_valid
        end
        it "should return the errors" do
          @game.violations.should include("In row 0, 9 appears 2")
        end
      end
    end #of validity and violations
    
    context "additional board manipulations" do
      describe "getting a list of blank cells from a board" do
        it "returns a list of blank cells" do
          @game.blanks.should have(45).blank_cells
        end
      end

      describe "getting a list of possibilities from a board" do
        it "returns an array of possible values" do
          @game.allowed[0][1].should eql("1")
        end
      end
    end # of additional board manipulations


  end # of Puzzle
end # of Module Sudoku
