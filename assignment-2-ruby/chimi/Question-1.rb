# Queston 1. Customize the room_cleaner program.
# Possibilities:
# Accept user input to get room names (or offer a selection of available rooms)
# Create an invoice-style output at the end of the program that varies based on the rooms and processes completed.


def make_bed
    puts "The beds have been made."
end
  
def vacuum(room)
    puts "The #{room} has been vacuumed."
end
  
def dust(room)
    puts "The #{room} has been dusted."
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
    dust(room)
    puts "The #{room} has been cleaned."
end


def clean_house
    rooms = Array.new
    loop do
        puts "Which room would you like cleaned? bathroom/bedroom/kitchen/living_room"
        room = gets.chomp
        if room == "kitchen" || room == "bathroom" || room == "bedroom" || room == "living_room"
            rooms = rooms << room
            puts "Is there another room you would like cleaned? y/n"
            another_room = gets.chomp
            if another_room == "y"
                print "Let's add another room."
                puts "\n"
                sleep (1)
            else
                print "Thank you. We will clean #{rooms}."
                sleep (1)
                break
            end    
        else 
            puts "We do not recognize that room."
            sleep (1)
        end
    end
    total_cost = 0
    rooms.each do |room|
        puts "Begin cleaning #{room}..."
        sleep (2)
        clean_room(room)
        total_cost += 50
        puts "*" * 40
        puts "\n"
        sleep(1)
    end
    puts "House cleaning complete. Total cost is $#{total_cost}. Please remit payment. Venmo preferred."
end
