
rooms = []

def get_rooms_to_clean(rooms)
  available_rooms = ["bedroom", "kitchen", "bathroom", "livingroom"]
  puts "Would you like to clean any of the following rooms: #{available_rooms} [y/n]"
  answer = gets.chomp.downcase

  while answer != "y" && answer != "n"
      puts "Please let us know your decision by answering 'y' or 'n'."
      answer = gets.chomp.downcase
  end 

  until answer == "n"
    puts "which room would like us to clean today?"
      room = gets.chomp.downcase

    if rooms.include?(room)
      puts "#{room} already added to the list."
    elsif available_rooms.include?(room)
        rooms.push(room)
    else
        puts "Not a valid room. Please select from the following rooms: #{available_rooms}."
    end

    puts "Would you like to clean another rooms? [y/n]"
    answer = gets.chomp.downcase
  end
end






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

def price(room)
  if room == "bedroom"
    return 10
  elsif room == "bathroom"
    return 20
  elsif room == "kitchen"
    return 20
  elsif room == "livingroom"
    return 10
  end
end   

def invoice(rooms)
  puts "Room Cleaning Invoice"
  puts "Room".ljust(10) + "Amount".rjust(30)

  balance = 0

  rooms.each do |room|
    puts room.ljust(10) + price(room).to_s.rjust(30)
    balance += price(room)
  end 
  puts "-" * 40
  puts "Balance".ljust(10) + balance.to_s.rjust(30)
  puts "*" * 40
end 



def clean_house(rooms)

  puts "Thank you for procuring my service."
  get_rooms_to_clean(rooms)
  puts "\n"
  sleep(1)
  rooms.each do |room|
    puts "Begin cleaning #{room}..."
    clean_room(room)
    puts "*" * 40
    puts "\n"
    sleep(1)
  end

  invoice(rooms)

  puts "House cleaning complete. Please remit payment. Venmo preferred."
end


clean_house(rooms)