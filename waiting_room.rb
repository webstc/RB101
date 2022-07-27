=begin


# PROBLEM

input: N >= 2
output: an array of numbers, each index the order that the person sat down

Explicit requirements: 
- find the array / hash of numbers whose index corresponds to the sitting order
- the number of chairs is always greater than 1


# Data Structure / Algorithm 

Data Structure: 

- use a hash 

Algorithm: 

- first, create an array that has a length of N
- second, place the first two seats, which will always be 1, next to the door and 2, farthest from the door
- 1) find the range that is largest between any two people -- make sure it's the one closest to the door.
--- if there are multiples of the same distance, choose the leftmost range
--- if the range is even, then chose the leftmost of the two middle numbers
--- if the range is odd, then choose the middle number

- Now repeat the above process, iterating through each until a number is added

-once all N spots are filled, return the array 

# PSEUDOCODE

START 

  /* given an integer greater than 2, N */
 
  SET arr = array with the following elements: [[1,N], [N,1]]
  
  FOR counter from (3 to N)
    SET target = 0
    SET distance_arr = []
   FOR i in 0 to arr.length - 2
     SET el1, el2 = arr[i][0] , arr[i+1][0]
     SET distance = [abs(el2-el1), - lower integer of (el1 + el2) / 2 ] 
     distance_arr << distance
   END
   SET target = - max (distance_arr) [1]
   arr << [target, counter]
   ary = ary.sort
  END
  
  final_line = ary.map {|a| a.first}
END

=end

def waiting_room(n)
  
  arr = [[1,1],[n,2]] # [ chair number , order the chair is chosent]
  
  for counter in 3..n do
    target = 0
    distance_arr = []
    
    for i in 0..arr.length-2 do
      el1 = arr[i][0]
      el2 = arr[i+1][0]
      distance = [el2 - el1, - ((el1 + el2)/2) ] # [ this is the distance between two elements, this is the index of the possible middle element (negative for reasons to be seen below)]
      distance_arr << distance
    end
    target = - distance_arr.max[1] # we used negative of the index before so that the max function [ maximizes distance from other person, minimizes distance from door]
    arr << [target, counter] # add the new "person" sitting on a chair to arr
    arr = arr.sort # re-sort arr so that the 'chair order' is correct
  end
  arr = arr.map {|seat| seat.reverse}.sort # here we reverse to [ order chosen, chair number] and then sort based upon order chosen
  how_they_took_their_seats = arr.map {|reverse_seat| reverse_seat.last} # now we collect all chair numbers into an array
end

p waiting_room(3) == [1,3,2]
p waiting_room(4) == [1,4,2,3]
p waiting_room(5) == [1,5,3, 2,4]
p waiting_room(10) == [1,10,5,7,3,8,2,4,6,9]
