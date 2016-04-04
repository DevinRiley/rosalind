class LexicalString
  attr_reader :alphabet, :string
  include Comparable

  def initialize(string)
    @string = string
  end

  def for_alphabet(alphabet)
    @alphabet = alphabet.chars
    self
  end

  def chars
    string.chars
  end

  def <=>(other)
    # rank according to order in provided alphabet
    other.chars.each.with_index do |other_letter, index|
      this_letter = string.chars[index]
      this_index = alphabet.find_index(this_letter)
      other_index = alphabet.find_index(other_letter)
      if this_index == other_index
        next
      elsif this_index < other_index
        return -1
      else
        return 1
      end
    end
     
    return 0
  end
end

