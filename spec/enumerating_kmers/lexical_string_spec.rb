require 'spec_helper'

describe LexicalString do
  context "with lexical ordering CBA" do
    describe "#sort" do
      it "is sorted according to the lexical ordering" do
        first = LexicalString.new("AB").for_alphabet("CBA")
        second = LexicalString.new("CB").for_alphabet("CBA")
        third = LexicalString.new("CC").for_alphabet("CBA")
        expect([first, second, third].sort).to eq [third, second, first]
      end
    end
  end
end
