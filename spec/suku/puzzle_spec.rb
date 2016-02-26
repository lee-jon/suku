require File.join(File.dirname(__FILE__), "/../spec_helper")

RSpec.describe Puzzle do
  describe "parsing inputs" do
    it "should not accept a non 81 character string" do
      expect { subject.parse_grid("Bad string") }.to raise_error ArgumentError
    end

    it "should contain blanks" do
      subject.parse_grid("." * 81)

      expect(subject.values["I9"]).to eq "123456789"
    end

    describe "with a correct string" do
      before do
        puzzle = "4.....8.5.3..........7....." \
                 ".2.....6.....8.4......1...." \
                 "...6.3.7.5..2.....1.4......"
        subject.parse_grid(puzzle)
      end

      it "parses A1" do
        expect(subject.values["A1"]).to eq "4"
      end

      it "parses D8" do
        expect(subject.values["D8"]).to eq "6"
      end

      it "parses I3" do
        expect(subject.values["I3"]).to eq "4"
      end
    end
  end

  describe "assigning a single value" do
    before { subject.assign("A1", "4") }

    it "should assign to the right square" do
      expect(subject.values["A1"]).to eq "4"
    end

    it "should elimiate the value from columns" do
      expect(subject.values["A9"]).to eq "12356789"
    end

    it "should elimiate the value from rows" do
      expect(subject.values["I1"]).to eq "12356789"
    end

    it "should eliminate the value from the box" do
      expect(subject.values["A2"]).to eq "12356789"
    end
  end
end
