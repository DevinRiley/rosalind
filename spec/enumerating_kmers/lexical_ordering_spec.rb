require 'spec_helper'

describe LexicalOrdering do
  describe "#alphabet" do
    it "takes an ordered lexigraphic alphabet" do
      order = LexicalOrdering.new("abc")
      expect(order.alphabet).to eq ["A", "B", "C"]
    end
  end

  describe "#lexically_ordered_strings_of_length" do
    context "with alphabet ABC and length 2" do
      let(:ordering) { LexicalOrdering.new("ABC") }

      it "includes AA" do
        expect(ordering.lexically_ordered_strings_of_length(2)).to include("AA")
      end

      it "includes CC" do
        expect(ordering.lexically_ordered_strings_of_length(2)).to include("CC")
      end

      it "includes AB" do
        expect(ordering.lexically_ordered_strings_of_length(2)).to include("AB")
      end

      it "includes BC" do
        expect(ordering.lexically_ordered_strings_of_length(2)).to include("AB")
      end
    end

    context "with alphabet ABC and length 3" do
      let(:ordering) { LexicalOrdering.new("ABC") }
      let(:length) { 3 }

      it "includes AAA" do
        expect(ordering.lexically_ordered_strings_of_length(length)).to include("AAA")
      end

      it "includes BBC" do
        expect(ordering.lexically_ordered_strings_of_length(length)).to include("BBC")
      end

      it "includes CCC" do
        expect(ordering.lexically_ordered_strings_of_length(length)).to include("CCC")
      end

      it "includes CAA" do
        expect(ordering.lexically_ordered_strings_of_length(length)).to include("CAA")
      end
    end

    context "with alphabet TAGC and length 2" do
      let(:ordering) { LexicalOrdering.new("TAGC") }
      let(:length) { 2 }

      it "includes TT" do
        expect(ordering.lexically_ordered_strings_of_length(length)).to include("TT")
      end
    end
  end
end
