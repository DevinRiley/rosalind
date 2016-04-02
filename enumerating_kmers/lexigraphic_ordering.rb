# take a subarray of length n
# for each position in the subarray, run through every letter after yourself including yourself.
# march the subarray forward one letter at a time until you run out of room
class LexigraphicOrdering
  attr_reader :alphabet, :ordered_strings, :length

  def initialize(alphabet)
    @alphabet = alphabet.upcase.chars
    @ordered_strings = []
  end

  def strings_of_length(length)
    @length = length
    permutations([], alphabet)
    ordered_strings
  end

  def permutations(existing, subalphabet)
    if existing.length == length
      ordered_strings << existing.join
    else
      subalphabet.each do |letter|
        remaining_letters = subalphabet[alphabet.find_index(letter)..-1]
        next if remaining_letters.nil?
        remaining_letters.each do |rem_letter|
          permutations(existing + [rem_letter], remaining_letters)
        end
      end
    end
  end
end

