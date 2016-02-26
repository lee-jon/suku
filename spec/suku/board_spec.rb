require File.join(File.dirname(__FILE__), "/../spec_helper")

RSpec.describe Board do
  subject { Board.new }

  describe "A blank board" do
    it { should respond_to :digits  }
    it { should respond_to :rows    }
    it { should respond_to :columns }

    it "should have 81 squares" do
      expect(subject.squares.count).to eq 81
    end

    it "should have 27 units in the unitlist" do
      expect(subject.unit_list.count).to eq 27
    end

    it "should have 3 units per square" do
      subject.squares.each do |s|
        expect(subject.units[s].count).to eq 3
      end
    end

    it "should have 20 peers per square" do
      subject.squares.each do |s|
        expect(subject.peers[s].count).to eq 20
      end
    end

    describe "square C2" do
      let(:square) { "C2" }
      let(:c2_peers) do
        %w(A2 B2 D2 E2 F2 G2 H2 I2 C1 C3
           C4 C5 C6 C7 C8 C9 A1 A3 B1 B3)
      end
      let(:c2_units) do
        [%w(A2 B2 C2 D2 E2 F2 G2 H2 I2),
         %w(C1 C2 C3 C4 C5 C6 C7 C8 C9),
         %w(A1 A2 A3 B1 B2 B3 C1 C2 C3)]
      end

      it "should match the peers" do
        expect(subject.peers[square]).to eq c2_peers
      end

      it "should match the units" do
        expect(subject.units[square]).to eq c2_units
      end
    end
  end
end
