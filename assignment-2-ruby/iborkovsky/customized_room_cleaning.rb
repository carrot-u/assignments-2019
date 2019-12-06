# helper functions
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

def welcome
	puts "Welcome to the InstaClean Cleaning Agency"
end

def goodbye
  puts "The cleaning is complet. Please remit the total."
end

def price(count)
	if count >= 4
		puts "That's so much work! We only have 3 employees."
    sleep(1)
		price_per_room = 30
		puts "You will be charged $#{price_per_room} per room"
	elsif count == 1
		puts "Hmm, couldn't you just do it yourself? But we can also help!"
    sleep(1)
		price_per_room = 50
		puts "You will be charged $#{price_per_room} per room"
	else
		puts "Sounds good!"
    sleep(1)
		price_per_room = 40
		puts "You will be charged $#{price_per_room} per room"
	end
	sleep (1)
	price_total = count * price_per_room
	puts "Your total is $#{price_total}."
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

def clean_house(rooms)
  sleep(1)
  rooms.each do |room|
    puts "Begin cleaning #{room}..."
    clean_room(room)
    sleep(1)
  end
end


#start of program and user input
welcome

puts "How many rooms would you like to clean?"
count = gets.chomp.to_i
price(count)

puts "Which of the following would you like to clean? Bathroom, kitchen, bedroom? List all that apply."
rooms = gets.chomp.split
if rooms.length != count
  puts "Hmm. You didn't enter the names for all the rooms you want cleaned. Please try again."
  exit
else
  puts "Let's get started!"
end

clean_house(rooms)
goodbye
