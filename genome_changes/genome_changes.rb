class Permutations
  attr_reader :n, :permutations

  def initialize(n)
    @n = n.to_i
    @permutations = []
    permute
  end

  def permute(remaining_elements = starting_elements, current_permutation = [])
    if remaining_elements.length > 0
      remaining_elements.each do |element|
        permute(remaining_elements - [element], current_permutation + [element])
      end
    else
      permutations << current_permutation
    end
  end

  def print
    puts permutations.length
    permutations.map { |permutation| puts permutation.join(" ") }
  end

  def starting_elements
    (1..n).to_a
  end
end

if __FILE__ == $0
  Permutations.new(ARGV[0]).print
end
