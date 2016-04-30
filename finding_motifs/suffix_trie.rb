class SuffixTrie
  attr_reader :alphabet, :links

  def initialize(alphabet)
    alphabet = alphabet.chars unless alphabet.is_a?(Array)
    @alphabet = alphabet
    @links = {}
  end

  def build_trie(corpus, root=nil)
    corpus = corpus.chars if corpus.is_a? String
    @root = {}
    corpus.each.with_index do |_, index|
      cur = @root
      corpus[index..-1].each do |letter|
        if cur[letter].nil?
          cur[letter]  = {}
        end
        cur = cur[letter]
      end
    end
  end

  def search(search_string)
    search_string = search_string.chars if search_string.is_a? String
    last_letter = search_string.length - 1

    cur = @root
    search_string.each.with_index do |letter, index|
      next_node = cur[letter]

      if index == last_letter
        return true
      elsif next_node
        cur = next_node
      else
        return false
      end
    end
  end
end
