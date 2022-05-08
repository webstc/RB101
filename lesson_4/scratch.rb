produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(input)
  selected_items = { }
 
  input.each do |key, value|
    if value.include?('Fruit')
      selected_items[key] = 'Fruit'
    end
  end
  selected_items
end


p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}