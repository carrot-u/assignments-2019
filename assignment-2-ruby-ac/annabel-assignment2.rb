#Question 1: Customize the room_cleaner 

room = ["kitchen", "bathroom", 'livingroom']

def mopped(room)
    puts "The #{room} has been mopped!"
end

def wash_dishes
    puts "The dishes have been washed"
end

def wiped(room)
    puts "The #{room} has been wiped down!"
end

def toilet_bowl
    puts "The toilet has been cleaned"
end

def vaccumed(room)
    puts "The #{room} has been vaccumed!"
end

def clean_house(room)
    if room == "kitchen"
        mopped(room)
        wash_dishes
    elsif room == "bathroom"
        wiped(room)
        toilet_bowl
    elsif room == "livingroom"
        vaccumed(room)
    else
        puts "The #{room} does not need a specific cleaning process"
    end

    mop_floor if room == "kitchen" || room == "bathroom"

# I am asking what their cleaning list will be

def create_cleaning_list
    print "Please name your cleaning list for the cleaning bot: "
    name = gets.chomp
    return name
end

def add_rooms
    print "What rooms would you like the bot to clean? (Kitchen, bathroom, livingroom)"
    rooms = gets.chomp
    return rooms
    puts "Great let me get started on those rooms!"
end

# print robot face at the end

def print_robot_face
  puts "__^_____^__"
  puts "|         |"
  puts "|  ^   ^  |"
  puts "|    >    |"
  puts "|    o    |"
  puts "|_________|"
  puts "still cleaning..........."
  sleep 3
  puts "I have finished cleaning!"
end

def print_robot_face_money
  puts "Cleaning complete! I'll take a burger and beer as payment!"
  puts "__^_____^__"
  puts "|         |"
  puts "|  ^   ^  |"
  puts "|    >    |"
  puts "|    $    |"
  puts "|_________|"
    sleep 3
    puts "Hello!!!!!!! I am still waiting for my burger and beer!"
    sleep 3
    puts "thank you for the payment! nom..nom.nom...burgers and beer"
end


#Question 2: Tiny Instacart

def accept_the_batch
    print " Yo!! You have a batch! Do you wish to accept? (y/n) "
    answer = gets.chomp
    put "Awesome, lets get started"
    sleep 3
    puts "Looks like our custome Annabel ordered from Costco, let's head over"
end

def navigating_to_store
    print "do you wish to use apple maps or google maps?"
    answer = gets.chomp
    if answer == apple maps
        puts "Are you sure?"
        if answer == "yes"
            break

        else
            if answer == "google maps"
                puts "Lets go!"
                break
            end
        end
    end
def review_shopping_list
    puts "Looks like you have 3 items to shop (banana, toilet paper, water)"
    puts "You have found the banana"
    sleep 2
    puts "You have found the toilet paper"
    sleep 5
    puts "You have found the water"
    sleep 3
    puts "Lets go checkout"
end

def deliver_order
    puts "Hi Annabel, here is your order! Thank You for using Tiny Instacart"
    sleep 1
    puts "   ---------   "
    puts "  |         |  "
    puts "  |_________|  "
    puts "  |  Tiny   | "
    puts "  |Instacart| "
    puts "  |_________|"
    sleep 3
    puts "Have a great day and don't forget to rate your experience with Tiny Instacart"
end

def tiny_instacart
    accept_the_batch
    navigating_to_store
    review_shopping_list
    deliver_order
    return "You have completed your customers order! Annabel has given you 5 stars for a job well done + a hefty tip!!"
end


    
#Question 3: Guessing Game

random_number = Random.new.rand

loop do
    print "Guess the mysterious number between 0 and 10 (e to exit): "
    answer = gets.chomp
    if answer == "e"
        puts "The mysterious number was 3."
        break
    else
        if answer.to_i == 3
            puts "You are correct!!"
            break
        else
            puts "Try Again:("
        end
    end
end

#made this one first to grasp concept

favorite_beer = Random.new.rand 

loop do
    print "Guess what my favorite beer is between Langunitas IPA and Bare Bottle IPA (e to exit):"
    answer = gets.chomp
    if answer == "e"
        puts "My favorite beer is Bare Bottle IPA."
        break
    else
        if answer == "Bare Bottle IPA"
            puts "You are correct!"
            break
        else
            puts "Try again!"
        end
    end
end
