
my_numbers = [1, 4, 3, 7, 2, 6]

def multiply(my_nums, my_mult)
  my_nums.map! do |x|
    x*my_mult
  end
  p my_nums
end

multiply(my_numbers, 6) # => [3, 12, 9, 21, 6, 18]