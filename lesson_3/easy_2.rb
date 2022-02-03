#4. 
#5.
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

#6.
flintstones << "Dino"
p flintstones

#7. 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino" << "Hoppy"
p flintstones

#8. 
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!("Few things in life are as important as ")
p advice

#8. bonus
#Using advice.slice would return "Few things in life are as important as ", but not mutatate
#the advice variable.

#9. first solution
i = 0
statement = "The Flintstones Rock!"
statement.each_char do |x|
  if x == "t"
   i = i+1
  end
end
p i

#9. second solution
statement = "The Flintstones Rock!"
puts statement.count('t')

#10. 
title = "Flintstone Family Members"
cen_title = title.center(40)

puts cen_title