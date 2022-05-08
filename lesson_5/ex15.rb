require 'pry'

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = []
arr.each do |hshes| 
  hshes.select! do |_, val_arr|
    val_arr.all? {|element| element.even?}
  end
  binding.pry
  new_arr << hshes
end

p new_arr