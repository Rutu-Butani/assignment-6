elements = ['two', 'three', 'one']
hash_to_be_sorted = {'three' => 3, 'two' => 2, 'one' => 1}

sorted_hash = hash_to_be_sorted.to_a.sort_by { |k, v| elements.index(k) }.to_h
puts sorted_hash # {'two'=>2, 'three'=>3, 'one'=>1}

