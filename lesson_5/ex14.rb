hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []

hsh.each do |_, inner_hsh| 
  if inner_hsh[:type] == 'fruit'
    inner_hsh[:colors].map! do |color|
      color.capitalize
    end
    arr << inner_hsh[:colors] 
  else 
    inner_hsh[:size].upcase!
    arr << inner_hsh[:size]
  end
end

p arr

