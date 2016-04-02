class HammingDistanceCalculator
  def initialize(first, second)
    @first = first
    @second = second
  end

  def calculate
    distance = 0
    @first.chars.each.with_index do |base, index|
      distance += 1 if base != @second.chars[index]
    end

    puts distance
  end
end

if __FILE__ == $0
  first = ARGF.readline
  second = ARGF.readline
  HammingDistanceCalculator.new(first, second).calculate
end
