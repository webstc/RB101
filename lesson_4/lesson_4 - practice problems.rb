statement = "The Flintstones Rock"
storehouse_hash = {}

statement.each_char do |x|
  if storehouse_hash.has_key?(x)
    storehouse_hash[x] = storehouse_hash[x] + 1
  else
    storehouse_hash[x]=1
  end
  storehouse_hash.delete_if {|key,_| key == " "}
end

p storehouse_hash
  