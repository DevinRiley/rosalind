# take a subarray of length n
# for each position in the subarray, run through every letter after yourself including yourself.
# march the subarray forward one letter at a time until you run out of room
class LexicalOrdering
  attr_reader :alphabet, :lexically_ordered_strings

  def initialize(alphabet)
    @alphabet = alphabet.upcase.chars
    @lexically_ordered_strings = []
  end

  def lexically_ordered_strings_of_length(length)
    @desired_length = length
    build_lexical_permutations(alphabet)
  end

  private

  attr_reader :desired_length

  def build_lexical_permutations(remaining_alphabet, current_string = [])
    if current_string.length == desired_length
      lexically_ordered_strings.push(current_string.join)
    else
      remaining_alphabet.each do |letter|
        build_lexical_permutations(remaining_alphabet(letter), current_string + [letter])
      end
    end

    lexically_ordered_strings
  end

  def remaining_alphabet(letter)
    beginning = alphabet.find_index(letter)
    alphabet[beginning..-1]
  end
end

