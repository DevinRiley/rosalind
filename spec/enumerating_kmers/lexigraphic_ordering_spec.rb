require 'spec_helper'

describe LexigraphicOrdering do
  describe "#alphabet" do
    it "takes an ordered lexigraphic alphabet" do
      order = LexigraphicOrdering.new("abc")
      expect(order.alphabet).to eq ["A", "B", "C"]
    end
  end

  describe "#strings_of_length" do
    context "with alphabet ABC and length 2" do
      let(:ordering) { LexigraphicOrdering.new("ABC") }

      it "includes AA" do
        expect(ordering.strings_of_length(2)).to include("AA")
      end

      it "includes CC" do
        expect(ordering.strings_of_length(2)).to include("CC")
      end

      it "includes AB" do
        expect(ordering.strings_of_length(2)).to include("AB")
      end

      it "includes BC" do
        expect(ordering.strings_of_length(2)).to include("AB")
      end
    end

    context "with alphabet ABC and length 3" do
      let(:ordering) { LexigraphicOrdering.new("ABC") }
      let(:length) { 3 }

      it "includes AAA" do
        expect(ordering.strings_of_length(length)).to include("AAA")
      end

      it "includes BBC" do
        expect(ordering.strings_of_length(length)).to include("BBC")
      end

      it "includes CCC" do
        expect(ordering.strings_of_length(length)).to include("CCC")
      end

      it "does not include CAA" do
        expect(ordering.strings_of_length(length)).to_not include("CAA")
      end
    end
  end
end
