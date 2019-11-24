# Customize the room_cleaner program.
# Possibilities:

# Accept user input to get room names (or offer a selection of available rooms)
# Create an invoice-style output at the end of the program that varies based on the rooms and processes completed.


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

def clean_house(rooms)
  puts "Thank you for procuring my service."
  print_robot_face
  puts "\n"
  sleep(1)
  rooms.each do |room|
    puts "Begin cleaning #{room}..."
    clean_room(room)
    puts "*" * 40
    puts "\n"
    sleep(1)
  end

  puts "House cleaning complete. Please remit payment. Venmo preferred."
  print_robot_face_money
end

def ask(question)
  print question + " "
  answer = gets.chomp.to_i
  return answer
end

def get_room_names()
  available_rooms = ["bedroom", "kitchen", "bathroom", "livingroom"]
  answer = ""
  rooms = []
  while answer != 4
    answer = ask("Enter the number to select a room: 0 - bedroom, 1 - kitchen, 2 - bathroom, 3 - livingroom, 4 - complete selection ")
    if answer.between?(0, 3) 
      if rooms.include?(available_rooms[answer])
        puts "The room #{available_rooms[answer]} is selected. "
      else
        rooms.push(available_rooms[answer])
        puts "The room #{available_rooms[answer]} is selected. "
      end
    elsif answer != 4
      print "Sorry, I didn't get that. Enter the number to select a room: 0 - bedroom, 1 - kitchen, 2 - bathroom, 3 - livingroom, 4 - complete selection "
    end
  end
  puts "You selected: "
  rooms.each do |item|
    puts item
  end
  return rooms
end

rooms = get_room_names()
clean_house(rooms)
