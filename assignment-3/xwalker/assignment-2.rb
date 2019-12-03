# 1. Customize the room_cleaner program.
# Possibilities:
#
# Accept user input to get room names (or offer a selection of available rooms)
# Create an invoice-style output at the end of the program that varies based on the rooms and processes completed.

$cleaning_array = []

def get_task
  puts "Name of the room you'd like for me to clean? (yes/no)"
  location = gets.chomp!

  puts "How many minutes should I spend cleaning #{location} this evening?"
  location_time = gets.chomp!

  puts "How many hours should I spend cleaning the #{location} per week?"
  cleaning_hours = gets.chomp!

  add_room_to_clean(location, location_time, cleaning_hours)

  puts "Do you have another room you would like to enter for cleaning?"
  response = gets.chomp!

  if response.downcase == "no"
    display_room_info
  else
    get_task
  end
end

def add_room_to_clean(location, location_time, cleaning_hours)
  rooms_hash = {
    name: location,
    time: location_time.to_i,
    hours: cleaning_hours.to_i,
  }
  $cleaning_array << rooms_hash
end

def display_room_info
  $cleaning_array.each do |location|
    puts "I will clean #{location[:name]} for #{location[:time]} minutes today and #{location[:hours]} hours/week as you requested."
  end
end

get_task

# 2. Tiny Instacart!
# Compose a simple terminal program using one or more of the common objects from Instacart (orders, drivers, batches, order_items, payments, etc)
#
# Design a desired workflow. ex. The entire flow of a driver from accepting a batch to delivery
# Using the tools and concepts from the completed room cleaner program, construct a self-running terminal program that successfully runs through your intended workflow.
# Test your program thoroughly to ensure that it runs as expected.

def batch_accept
  puts "Accept Batch (Y/N)"
  response = gets.chomp!
  if response.downcase == "n"
    reliability_incident
  else
    shopper_accepted_batch
  end
end

def reliability_incident
  puts "You've received a reliability incident"
  sleep(1)
  puts "You must wait 10 seconds before you can accept a batch"
  sleep(10)
  batch_accept
end

def shopper_accepted_batch
    order_items = ['Root Beer', 'Vanilla Bean Ice Cream', 'Chocolate Syrup']
    found_item = []
    unfound_item = []
    order_items.each do |item_name|
      puts "Have you located #{item_name}? (Y/N)"
      has_item_located = gets.chomp!
      if has_item_located == "n"
        puts "We've refunded #{item_name}"
        unfound_item.append(item_name)
      else
        #push result item_name into found_item array
        found_item.append(item_name)
      end
    end
    #summarize batch
    found_item.each do |item_name|
    puts "Shopper was able to locate #{item_name}."
    sleep(3)
  end
  order_delivery
end

def order_delivery
  puts "Starting delivery to 50 Beale Street"
  sleep(1)
  puts "Arriving"
  sleep(2)
  puts "Order Complete"
end

batch_accept

# 3. Guessing Game:
# Create a simple terminal program where the user guesses a randomly generated number.

def random
  guess_this_number = rand(1..10)
  puts "Guess a number between 1 & 10"
  answer = gets.chomp.to_i
  until answer == guess_this_number do
    puts "Try again"
    answer = gets.chomp.to_i
  end
  puts "You guessed it!"
end

random
