require 'spec_helper'

describe SuffixTrie do
  describe "#alphabet" do
    it "is instantiated with an alphabet" do
      alphabet = "ACGT"
      expect(SuffixTrie.new(alphabet).alphabet).to eq alphabet.chars
    end
  end

  describe "#links" do
    it "has links to nodes of all letters of the alphabet" do
      alphabet = "ACGT"
      trie = SuffixTrie.new(alphabet)
      alphabet.chars.each do |letter|
        expect(trie.links[letter]).to be_nil
      end
    end
  end

  describe "#search" do
    it "can find the longest substring (ie substring == string)" do
      alphabet = "ACGT"
      trie = SuffixTrie.new(alphabet)
      trie.build_trie("GAT")
      expect(trie.search("GAT")).to eq true
      expect(trie.search("TAG")).to eq false
    end

    it "can find a substring that starts at the beginning of the input string" do
      alphabet = "ACGT"
      trie = SuffixTrie.new(alphabet)
      trie.build_trie("GAT")
      expect(trie.search("GA")).to eq true
    end

    it "can find a substrings that starts in the middle of the input string" do
      alphabet = "ACGT"
      trie = SuffixTrie.new(alphabet)
      trie.build_trie("GATTACA")
      expect(trie.search("A")).to eq true
      expect(trie.search("AT")).to eq true
      expect(trie.search("TAC")).to eq true
      expect(trie.search("TACA")).to eq true
    end
  end
end
