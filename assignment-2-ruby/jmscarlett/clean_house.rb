

def dust(room)
  puts "The #{room} has been dusted"
end

def vacuum(room)
  puts "The #{room} has been vacuumed."
end

def make_bed
  puts "The bed has been made."
end

def mop_floor
  puts "The floor has been mopped."
end

def wash_dishes
  puts "The dishes have been washed."
end

def clean_toilet
  puts "The toilet has been cleaned."
end

def clean_room(room)
  if room == "bedroom"
    vacuum(room)
    make_bed
  elsif room == "kitchen"
    mop_floor
    wash_dishes
  elsif room == "bathroom"
    mop_floor
    clean_toilet
  else
    puts "The #{room} requires no specific cleaning processes."
  end

  mop_floor if room == "kitchen" || room == "bathroom"

  dust(room)
  puts "The #{room} has been cleaned."
end

def print_robot_face
  puts "__^_____^__"
  puts "|         |"
  puts "|  ^   ^  |"
  puts "|    >    |"
  puts "|    o    |"
  puts "|_________|"
end

def print_robot_face_money
  puts "__^_____^__"
  puts "|         |"
  puts "|  ^   ^  |"
  puts "|    >    |"
  puts "|    $    |"
  puts "|_________|"
end

def ask(question)
    print question + " "
    answer = gets.chomp.downcase
    return answer
  end


def clean_house
  puts "Thank you for procuring my service."
  print_robot_face
  puts "\n"
  sleep(1)
  
  puts "What room would you like me to clean?"
        sleep(1)
        answer = ""
        rooms = Array.new
        room = ""
        loop do 
            room = ask("Room name: ")
            rooms.push(room)
            answer = ask("Do you want to add a room? (y/n) ")
        break if answer == "n"     
        end
    sleep (1)
    puts "\n"
  rooms.each do |room|
    puts "Begin cleaning #{room}..."
    clean_room(room)
    puts "*" * 40
    puts "\n"
    sleep(2)
  end

    puts "House cleaning complete."
    print_robot_face_money
    puts "\n"

puts "\t Rooms cleaned:"
rooms.each do |room|
    puts "\t \t #{room}"
end
if rooms.length > 1
    puts "Price for #{rooms.length} rooms is $ #{rooms.length * 20}."
else 
    puts "Price for #{rooms.length} room is $ #{rooms.length * 20}."
end
puts "Please remit payment. Venmo prefered"
end


clean_house

