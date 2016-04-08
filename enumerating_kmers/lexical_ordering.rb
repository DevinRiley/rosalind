class LexicalOrdering
  attr_reader :alphabet, :lexically_ordered_strings

  def initialize(alphabet)
    @alphabet = alphabet.delete(' ').strip.upcase.chars
    @lexically_ordered_strings = []
  end

  def lexically_ordered_strings_of_length(length)
    @permutation_length = length.to_i
    build_lexical_permutations(alphabet)
    lexically_ordered_strings
  end

  private

  attr_reader :permutation_length

  def build_lexical_permutations(remaining_alphabet, current_string = [])
    if current_string.length == permutation_length
      lexically_ordered_strings << current_string.join
    else
      remaining_alphabet.each do |letter|
        build_lexical_permutations(alphabet, current_string + [letter])
      end
    end
  end
end

if __FILE__ == $0
  alphabet, length = File.readlines(ARGV[0])
  alphabet = alphabet.delete(' ')
  ordering = LexicalOrdering.new(alphabet)
  puts ordering.lexically_ordered_strings_of_length(length)
end
