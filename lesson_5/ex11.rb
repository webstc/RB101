arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

final = arr.map do |inner_arr| 
  inner_arr.select do |el|
    el % 3 == 0
  end
end

p final