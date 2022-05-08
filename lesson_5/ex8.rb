hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = []
hsh.each_value do |arr|
  arr.each do |str|
    str.chars.each do |ltr|
     if ltr == "a" || ltr == "e" || ltr == "i" || ltr == "o" || ltr == "u"
       vowels << ltr
     end
    end
  end
end

p vowels