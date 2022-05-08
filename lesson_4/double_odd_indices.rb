def double_odd_indices(arr)
  arr.each_index do |idx, val|
    if idx.odd?
      arr[idx] = 2*arr[idx]
    end
  end 
  p arr
end


my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_indices(my_numbers)  # => [2, 4, 6, 14, 2, 6]


# not mutated
my_numbers                      # => [1, 4, 3, 7, 2, 6]