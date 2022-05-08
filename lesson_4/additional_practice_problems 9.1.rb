
def titleize(words)
  ary_words = words.split(" ") 
  ary_words.each do |x| 
    x.capitalize! 
  end
  ary_words.join(" ")
end


words = "the flintstones rock"

p titleize(words)



