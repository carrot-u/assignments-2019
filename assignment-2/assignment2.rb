=begin
1. Customize the room_cleaner program.
Possibilities:
Accept user input to get room names (or offer a selection of available rooms)
Create an invoice-style output at the end of the program that varies based on the rooms and processes completed.
=end



rooms = []
puts "Enter a room, i.e. bedroom, kitchen, bathroom, livingroom, "
select_room = gets.chomp

rooms.push(select_room)


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
=begin
2. Tiny Instacart!
Compose a simple terminal program using one or more of the common objects from Instacart (orders, drivers, batches, order_items, payments, etc)

Design a desired workflow. ex. The entire flow of a driver from accepting a batch to delivery
Using the tools and concepts from the completed room cleaner program, construct a self-running terminal program that successfully runs through your intended workflow.
Test your program thoroughly to ensure that it runs as expected.
Possible Extensions:

Ruby offers alternatives to if/else including unless, while, and until.
Set parameters for your program through user input
Make sure to incorporate if/else and the appropriate operators.
Look up how to use a ruby hash to create an array with multiple attributes per array element and run an each loop that checks the values of said attributes. ex. (`drivers = [{name: "Rose", role: "in-store-shopper"}, {name: "Donna", role: "shift-lead"}, {name: "Amelia Pond", role: "full-service"}, {name: "Martha Jones", role: "cashier"})
=end

def accept_batch
  puts "You have a new batch, enter \'Yes\' to accept or \'No\' to decline "
  response = gets.chomp
  if response.downcase == "yes"
    puts 'Lets get started!'
  elsif response.downcase == "no"
    puts 'You have failed to accept the batch! Please wait for the next batch'
  else
    puts 'You have failed to accept the batch! Please wait for the next batch'
  end
end

def deliver_batch
  puts "Deliver the order to 123 Beagle St unit 2006."
  puts "Enroute"
  sleep(1)
  puts "."
  sleep(1)
  puts ".."
  sleep(1)
  puts "..."
  puts "You have arrived at the destination."
end

def customer_receive
  puts "Knock on the customer's door. Is the customer home? Yes or No"
  loop do
    response = gets.chomp
    if response.downcase == "yes"
      puts "Great job successfully delivering the batch!"
      break
    elsif response.downcase == "no"
      puts "Leave a message for the customer that the batch has been left at the door"
      break
    else
      puts "Leave a message for the customer that the batch has been left at the door"
      break
    end
  end
end


accept_batch
deliver_batch
customer_receive



=begin
3. Guessing Game:
Create a simple terminal program where the user guesses a randomly generated number.

Hints:

You'll want to look at other kinds of loops, the rand() method, and gets.chomp logic
Bonus: REVERSE IT! Have the computer guess the user's input.
MOAR Bonus: Look up how to implement a "binary search" to minimize the number of guesses the computer makes.
=end



def generate_random_num(lower, upper)
  return rand(lower..upper)
end

def define_scope
 puts "Lets set the limits for our guess"
 puts "Enter the lower limit and press enter when done"
 lower = gets.chomp
 puts "Got it. Enter the higher limit and press enter when done"
 upper = gets.chomp
 limits= [lower,upper]
 return limits
end


scope = define_scope
answer = generate_random_num(scope[0].to_i, scope[1].to_i)
last_guess = 0
guess_count = 0
count = 0
loop do
  puts "Make a guess!"
  guess = gets.chomp.to_i
  if guess == answer
    puts "#{answer} is correct! It took you #{guess_count}guesses."
    break
  elsif guess != answer
    puts "#{guess} is not correct, please try again."
    guess_count = guess_count + 1


    #last_guess = guess
    #if (count == 0)
    #  puts "#{guess} is not correct, please try again."
    #  count +=
    #end
    #elsif ((guess - answer).abs) < ((last_guess - answer).abs)
    #  puts "Incorrect but getting warmer!"
    #else
    #  puts "Incorrect and getting colder!"
    #end
    # last guess 8
    # answer = 4
    # current guess 2
    # 2- 4 = -2, 8-4 = 4
  end
end
