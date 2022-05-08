flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |val, idx| 
  flintstones_hash[val] = idx
end

p flintstones_hash
