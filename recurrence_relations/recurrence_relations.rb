def num_rabbits(juvenile_rabbits, adult_rabbits, remaining_generations, offspring_per_pair)
  if remaining_generations == 1
    juvenile_rabbits + adult_rabbits
  else
    num_rabbits(adult_rabbits * offspring_per_pair, juvenile_rabbits + adult_rabbits, remaining_generations - 1, offspring_per_pair)
  end
end

if __FILE__ == $0
  args = gets.split(' ').map(&:to_i)
  puts num_rabbits(1, 0, *args)
end
