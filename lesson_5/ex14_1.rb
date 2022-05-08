require 'pry'

hash = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# 1. look at each hash line
# 2. go to the inner hash
# 3. for all fruits, find the colors array
# 3a. for colors, capitalize
# 4. for all vegetables, find the size array
# 4a. for size, upcase
# 5. return an array containing the colors and sizes of fruits and veggies respectively

def fruit_salad(hsh)
  hsh.values.map do |inner_hsh|
    if inner_hsh[:type] == 'fruit'
      inner_hsh[:colors].map do |color|
        color.capitalize
      end
    elsif inner_hsh[:type] == 'vegetable'
      inner_hsh[:size].upcase
    end
  end
end

p fruit_salad(hash)



