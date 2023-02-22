def phonebook_manager
 
    
    puts "Phonebook Options"
    puts "1. Find a phone number"
    puts "2. Save a new number"
    puts "3. Delete a number"



    print "Enter your choice: "
    choice = gets.chomp.to_i

   
    case choice
    when 1
      print "Enter the person's name: "
      name = gets.chomp
      number = find_number_by_name(name)
      if number
        puts "#{name}: #{number}"
      else
        puts "No phone number found for #{name}."
      end
    when 2
      print "Enter the person's name: "
      name = gets.chomp
      print "Enter the phone number: "
      number = gets.chomp
      save_number(name, number)
      puts "Phone number saved."
    when 3
      print "Delete by name or by number? (n/nm): "
      choice = gets.chomp.downcase
      case choice
      when "n"
        print "Enter the person's name: "
        name = gets.chomp
        delete_number(name)
        puts "Phone number deleted."
      when "nm"
        print "Enter the phone number: "
        number = gets.chomp
        delete_number(number)
        puts "Phone number deleted."
      end
      end
     
  
end



def find_number_by_name(name)
  phonebook = load_phonebook()
  phonebook[name]
end

def save_number(name, number)
  phonebook = load_phonebook()
  phonebook[name] = number
  save_phonebook(phonebook)
end

def delete_number(search_term)
  phonebook = load_phonebook()

  if phonebook.has_key?(search_term)
    phonebook.delete(search_term)
  else
    phonebook.delete_if { |name, number| number == search_term }
  end

  save_phonebook(phonebook)
end

def load_phonebook
  phonebook = {}

  if File.exist?("phonebook.txt")
    File.open("phonebook.txt", "r") do |file|
      phonebook = eval(file.read)
    end
  end

  phonebook
end

def save_phonebook(phonebook)
  File.open("phonebook.txt", "w") do |file|
    file.write(phonebook.inspect)
  end
end


phonebook_manager


