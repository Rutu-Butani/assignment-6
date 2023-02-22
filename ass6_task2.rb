def phonebook_manager
 
    
    puts "Phonebook Options"
    puts "1. Find a phone number"
    puts "2. Save a new number"
    puts "3. Delete a number"

    print "Enter your choice: "
    choice = gets.chomp.to_i

   
    case choice
    when 1
      proc = Proc.new{print "Enter the person's name: "}
      proc.call
      name = gets.chomp
      number = find_number_by_name(name)
      if number
        puts "#{name}: #{number}"
      else
        puts "No phone number found for #{name}."
      end
    when 2
      proc = Proc.new{print "Enter the person's name: "}
      proc.call
      name = gets.chomp
      save_number(name)
      
    when 3
      proc = Proc.new{print "Delete by name or by number? (n/nm): "}
      proc.call
      choice = gets.chomp.downcase
      case choice
      when "n"
        proc = Proc.new{print "Enter the person's name: "}
         proc.call
        name = gets.chomp
        delete_number_by_n(name)

      when "nm"
        proc = Proc.new{print "Enter the phone number: "}
         proc.call
        number = gets.chomp
        delete_number_by_nm(number)
        
      end
      end
     
  
end



def find_number_by_name(name)

  phonebook = load_phonebook()
  if phonebook[name]
    puts "#{name}'s number is #{phonebook[name]}"
  else
    puts "Could not find #{name} in phonebook."
  end
  phonebook[name]
end

def save_number(name)
  phonebook = load_phonebook()
  
  if phonebook.has_key?(name)
    puts "Name already exists"
    
  else
    print "Enter the phone number: "
    number = gets.chomp
    phonebook[name] = number
    puts "phone-number saved"
    save_phonebook(phonebook)
  end
  
end


def delete_number_by_n(search_term)
  phonebook = load_phonebook()

  if phonebook.has_key?(search_term)
    phonebook.delete(search_term)
    puts "Phone number deleted."
  else
    puts "Record not found!"
  end

  save_phonebook(phonebook)
end

def delete_number_by_nm(search_term)
  phonebook = load_phonebook()

  if phonebook.has_key?(phonebook.key(search_term))
    phonebook.delete(search_term)
    puts "Phone number deleted."
  else
    puts "Record not found!"
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


