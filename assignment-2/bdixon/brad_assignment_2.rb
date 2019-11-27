## Question 1 Customize the Room cleaning robot
rooms = []
puts "What room would you like me to clean? "
choose_room = gets.chomp

rooms.push(choose_room)

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


clean_house(rooms)

## Question 2 Tiny Instacart
## Compose a simple terminal program using one or more of the common objects 
## from Instacart (orders, drivers, batches, order_items, payments, etc)

def accept_batch
  print "There's a new batch. Do you want to accept? Yes or No? "
  batch_response = gets.chomp
  if batch_response.downcase == "yes"
    puts "Ok great! You can now view the batch details."
  else 
    puts "No worries. We'll send you a new batch soon."
    exit!
  end
end

def view_batch_details
    print "Do you want to review the batch details? Yes or No? "
    details_response = gets.chomp
    if details_response.downcase == "yes"
        batch_details = { "Customer" => "Hillary Clinton", "Store" => "Sprouts", "Store Location" => "3035 Broadway, Oakland, CA", "Items Count" => "4", "Delivery Location" => "123 Main Street, Oakland, CA" }
        puts batch_details
    else
        puts "Ok."
    end
end

def navigate_to_store
    print "Do you need directions? Yes or No? "
    direction_response = gets.chomp
    if direction_response.downcase == "yes"
        puts "Sounds good! You are 1.5 miles from the destination. Take a left on Grand St. in 500 ft."
        sleep(2)
        puts "Turn left now."
        sleep(1)
        puts "Your destination is on the right in 1.2 miles"
        sleep(2)
        puts "You are now at your destination."
    else
        puts "Great."
    end
end

def review_list
    puts "Time to review the list."
    puts "Your customer has ordered the following items: milk, cookies, chocolate, a dvd of 'Love Actually'. Now it's time to shop!"
end

def missing_items
    print "It looks like you are missing an item, which item are you missing? "
    item = gets.chomp
    puts "Ok, we will let your customer know that #{item} will not be included in their order and see if they'd like a replacement."
    sleep(2)
    puts "It looks like your customer does not want a replacement for #{item} so you are good to checkout!"
end

def checkout
    puts "Please scan all of your items at the checkout."
    sleep(2)
    puts "The total of all of your items is $19.32. Please use your Marqueta card to complete the purchase."
end

def delivery_location
    puts "Your customer's delivery address is 123 Main Street in Oakland, CA"
    print "Do you need directions to your customer's delivery location? Yes or no? "
    delivery_response = gets.chomp
    if delivery_response.downcase == "yes"
        puts "Sounds good. Take Grand Street Northwest for 1.1 miles, then make a left on Main Street."
        sleep(2)
        puts "Now turn left."
        puts "You destination is on the right in 1.3 miles."
        sleep(2)
        puts "You have now arrived at your delivery location."
    end
end

def mini_instacart
    accept_batch
    sleep(1)
    view_batch_details
    sleep(1)
    navigate_to_store
    sleep(2)
    review_list
    sleep(5)
    missing_items
    sleep(1)
    checkout
    delivery_location
    puts "Thank you for completing your shop! Your customer is very happy and rated you 5 stars. We appreciate your service as an Instacart shopper!"
end

mini_instacart

## Question 3 Guessing Game:
## Create a simple terminal program where the user guesses a randomly generated number.
random_number = Random.new.rand()
loop do
  print "Can you guess what random number I'm thinking? Guess any random number (e to exit): "
  answer = gets.chomp
  if answer == "e"
    puts "The number was #{random_number}."
    break
  else
    if answer.to_i == random_number
      puts "You guessed correctly!"
      break
    else
      puts "Try again."
    end
  end
end