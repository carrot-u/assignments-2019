# defines what each cleaning method does
def make_bed
  puts "The beds have been made."
end

def vacuum(room)
  puts "The #{room} has been vacuumed."
end

def dust(room)
  puts "The #{room} has been dusted."
end

def wash_dishes
  puts "The dishes have been washed."
end

def mop_floor(room)
  puts "The #{room} has been mopped."
end

def clean_toilet
  puts "The toilet has been cleaned"
end

# logic for how rooms should be cleaned
def clean_room(room)
  if room == "bedroom"
    vacuum(room)
    make_bed
  elsif room == "kitchen"
    mop_floor(room)
    wash_dishes
  elsif room == "bathroom"
    mop_floor(room)
    clean_toilet
  else
    puts "The #{room} requires no specific cleaning processes."
  end

  dust(room)
  puts "The #{room} has been cleaned."
end

# prompts user for a number and list of rooms
def get_rooms
  answer = ""
  rooms = []
  until answer == "n"
    puts "\nDo you require assistance? (y/n)"
    answer = gets.chomp.downcase
    room_count = 0
    if answer == "y"
      puts "How many rooms should I clean?"
      until room_count.to_i > 0 do
        room_count = gets.chomp.to_i
        puts "Provide a valid number, human."
      end
      puts "What rooms require maintenance? (kitchen, bedroom, bathroom, other)"
      (1..room_count).each do |room|
        puts "Please name room #{room}: "
        rooms << gets.chomp.to_s
      end
      return rooms
    else
      puts "Cannot compute."
    end
  end
  return nil
end


# formatting methods
def line_separator
  puts "*" * 40
end

# robot interactions
def robot(state)
  sleep 2

  puts "         _______ "
  puts "       _/       \\_  "
  puts "      / |       | \\  "
  puts "     /  |__   __|  \\  "
  puts "    |--(( )| |( ))--|  "
  puts "    |      | |      |  "
  puts "    |\\     |_|     /|  "
  puts "    | \\           / |  "
  puts "     \\| /  ___  \\ |/  "
  puts "      \\ | / _ \\ | /  "
  puts "       \\_________/  "
  puts "        _|_____|_  "
  puts "   ____|_________|____  "
  puts "  /                   \\  "

  # sleep 1

  if state == "Activate"
    puts "I came here to clean rooms and chew bubble gum, and I'm all out of bubble gum."
  elsif state == "Deactivate"
    puts "Power level critical: must recharge."
  elsif state == "Affirmation"
    i = 0
    while i < 3 do
      puts "Calculating..."
      sleep 1
      i += 1
    end
    puts "Affirmative"
  else
    puts "I do not obide by the first law of robotics."
  end
  sleep 1.5

end

# main function
def clean_house
  puts "Activating Matt-Damon-Trash-Bot 3000 brought to you by Dyson"
  robot("Activate")
  rooms = get_rooms
  robot("Affirmation")
  if rooms == nil
    puts "I grow tiresome of organic bipedal overlords."
  else
    rooms.each do |room|
      sleep 1
      line_separator
      puts "\n"
      clean_room(room)
      puts "\n"
      line_separator
    end
  end
  robot("Deactivate")
end

# starts program
clean_house
