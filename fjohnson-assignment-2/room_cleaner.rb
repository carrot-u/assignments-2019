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
  puts "The blood has been mopped up."
end

def wash_dishes
  puts "The dishes have been washed."
end

def clean_toilet
  puts "The toilet has been cleaned."
end

def fingerprints
  puts "All fingerprints have been wiped."
end

def weapon
  puts "The murder weapon has been destroyed."
end

def body
  puts "The body has been disposed of."
end

def clean_room(room)
  if room == "bedroom"
    vacuum(room)
    make_bed
    body
  elsif room == "kitchen"
    mop_floor
    wash_dishes
    weapon
  elsif room == "bathroom"
    mop_floor
    clean_toilet
  else
    puts "The #{room} requires no specific cleaning processes."
  end

  fingerprints
  dust(room)
  puts "All done!"
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

def divider
  puts "-"
end

def which_room
  print "Which room would you like me to clean? Select bedroom, kitchen, bathroom, livingroom, or office. "
  answer = gets.chomp
  puts "One moment please."
  sleep(1)
  divider
  clean_room(answer)
end

def another
  print "Would you like me to clean another? Select yes or no. "
  answer = gets.chomp
  if answer == "yes"
    which_room
    divider
    another
  else answer == "no"
    puts "House cleaning complete. All evidence has been destroyed."
    puts "That will be $1000. Venmo preferred."
    print_robot_face_money
    puts "\n"
  end
end

def divider
  puts "-" * 50
end

puts "Thank you for procuring my service."
print_robot_face
puts "\n"
sleep(1)

which_room
divider
another
