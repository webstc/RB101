#1. "greeting" is initialized as nil ! 

if false
  greeting = "hello world"
end

greeting


#2. 
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => {:a => "hi there"}


#3A. ????

def mess_with_vars(one, two, three)
  one = two #new variable points to "two"
  two = three #new variable points to "three"
  three = one #new variable points to "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #two
puts "two is: #{two}" #three
puts "three is: #{three}" #one



#3B. ????

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #"one"
puts "two is: #{two}" #"two"
puts "three is: #{three}" #"three"


#3C. 

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #"two"
puts "two is: #{two}" #"three"
puts "three is: #{three}" #"one"


#4. 
# input the string of an ip address
# break it into separated "words"
#CHECK TO SEE IF THE NEW STRING IS length 4.
# for each "word"
# return an error message and false whenever
# (1) the size of the words is less than 4
# (2) the words are not valid
# the below code could be simplifies if I wasn't sending a message ""

# remember: "return false" will end the method, so no need for "break"

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless input_string.size == 4 
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
    end
  end
  return true
end

