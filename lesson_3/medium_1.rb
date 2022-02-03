#1. 
a = "The Flintstones Rock"
10.times {puts a.prepend(" ")}

#1. solution (note the (" " * number))
# 10.times { |number| puts (" " * number) + "The Flintstones Rock!" }


#2. The error results from adding a string to an integer and trying to print as a string...
#solution #1: 
puts "the value of 40 + 2 is ".to_i + (40 + 2)


#solution #2: 
puts "the value of 40 + 2 is " + (40 + 2).to_s


#3. 
def factors(number)
  divisor = number
  factors = []
  loop do
    break if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end 
  factors
end

puts factors(-1)

#3 bonus: The purpose of number % divisor == 0 is to check to see if the remainder of number/divisor is equal to zero
#if so, then divisor is a factor of number

#3 bonus 2: factors returns the array of factors that the method has found.


#4. 
#The difference between the two methods is that the second method would create a nested array, where 
#when a new element is added to the buffer.  Whereas the first method would create an array where each 
#new_element would be added into the buffer array.

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

a = ["1","2","3","0"]
p rolling_buffer1(a, 2, "wanda")
p rolling_buffer2(a, 2, "wanda")


#5. the limit variable needs to be defined within the fib method definition


def fib(first_num, second_num)
  limit = 15
  while (first_num + second_num) < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"


#6. 34

#7. No, the data did not get ransacked.  

