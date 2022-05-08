require 'pry'

def joinor(arr, div = ', ', prep = 'or')
  last = arr.pop
  if arr.size == 0
    last.to_s
  elsif arr.size == 1
    arr.join + " " + prep + " " + last.to_s
  else
    arr.join(div) + div + prep + " " + last.to_s
  end
end

p joinor([1])
p joinor([1,2])
p joinor([1,2,3])
p joinor([1,2,3,4], "; ", "and")
