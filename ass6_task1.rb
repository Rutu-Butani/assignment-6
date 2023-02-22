
input_file = File.open("array.txt")
input_array = eval(input_file.read)

counts = Hash.new(0)

input_array.each do |element|
  counts[element] += 1
end

output_file = File.open("output.txt", "w")
counts.each do |element, count|
  if count < 2
  output_file.write(element.to_s + "=>" + count.to_s + " ")
  counts.delete(element)
  end 
end

puts counts


