# Imagine a sequence of consecutive EVENf integers beginning with 2.  The integers are grouped 
# in rows, with the first row containing one integer, the second row containing 
# two integers, the third row containing three integers, and so on.  Given an integer
# representing the number of a particular row, return an integer representing the
# sum of all integers in that row.

# P. Understand the problem
# input = integer
# output = integer
# Questions about the problem: 
#.  -- Does the integer need to be the first integer in the 
#  row or could it be an integer in the middle of the row?  For instance, if the third 
# row is = 4,5,6 would the integer have to be 4?  Or could it be 5 or 6, and then 
# we need to add everything in that row? 
# -- what should be returned if the integer is negative? 
# -- what should be returned if the integer is zero?  



# E.  Examples and Test Cases

# n = 3; [4,5,6]; output = 15
# n =4; output = 15
# i = 1; [1]; output = 1
# i = -1??  
# n = 0?? 


# note: last number = n*(n-1)
# [2], size = 1; range = 2
# [4,6], size = 2; range = 4..6
# [8,10,12], size = 3; range = 8..12
# [14,16,18,20], size = 4; range = 14..20
# [22,24,26,28,30], size = 5; range = 22..30
# [32,34,36,38,40,42], size = 6; range = 32..42

# note: every first number in the array = the previous number + i-1
# for instance, the first number of the third row (i=3) is equal to 4 = 1 + 2 + i-1


# D. Data Structure



# A. Algorithm

# high level


# get an integer from the user
# set first_row_num = (input)*(input-1)/2 + 1
# this is the row number without it being an even row number
# set last_row_num = input*(input+1)
# this is the last row number without it being an even row number
#
# create an array called arr of even integers with first_row_num as the beginning and 
#    last_row_num as the end
#. -- mutate arr to include only even numbers.
# sum arr
# output arr
# end




# C. Code


puts "Please enter an integer."
input = gets.chomp.to_i
first_row_num = (input)*(input-1)/2 + 1
last_row_num = input*(input+1)/2

arr = Array(first_row_num..last_row_num)
arr.map! {|x| x*2} 
puts "The array is: "
p arr
puts "And the sum is #{arr.sum}."

  


