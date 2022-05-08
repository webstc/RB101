

def double_numbers!(num_arr)
  num_arr.map! {|x| 2*x}
end

a = [3,4,5,6,768]
p a.object_id

p double_numbers!(a)

p a.object_id