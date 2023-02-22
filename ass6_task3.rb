hash = { "three" => 3, "two" => 2, "one" => 1 }
array = ["two", "three", "one"]

new_hash = {}
    array.each do |key, value|
    new_hash[key] = hash[key]
    
end
puts new_hash
