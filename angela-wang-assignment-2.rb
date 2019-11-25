# Q1

class Clean_room
  attr_accessor :mp, :vp, :mfp, :wp, :cp
  def ini(mp,vp)
  	@mp = mp
  	@vp = vp
  	@mfp = mfp
  	@wp = wp
  	@cp = cp
  end
  def make_bed
  	puts "The beds have been made. Price: 5 dollors"
    @mp = 5
  end

  def vaccuum(room)
    puts "The #{room} has been vacuumed. Price: 6 dollors"
    @vp = 6
  end
  def mop_floor
    puts "The floor has beem mopped. Price: 7 dollors"
    @mfp = 7
  end

  def wash_dishes
    puts "The dishes have been washed. Price: 8 dollors"
    @wp = 8
  end

  def clean_toilet
    puts "The toilet has been cleaned. Price: 9 dollors"
    @cp = 9
  end

  def clean_room
    while true
      puts "please select the room to clean up: bedroom, kitchen or bathroom. e to exit."
	  room = gets.downcase.chomp	  
	  if room == ""
	    puts "select a room in the list."
	  elsif room == "bedroom"
	    make_bed
	  	vaccuum(room)
	  	puts "Total price is #{@mp.to_i + @vp.to_i} dollars"
	  elsif room == "kitchen"
	    mop_floor
	    wash_dishes
        puts "Total price is #{@mfp.to_i + @wp.to_i} dollars"
	  elsif room == "bathroom"
	    mop_floor
	    clean_toilet
	    puts "Total price is #{@mfp.to_i + @cp.to_i} dollars" 	
	  elsif room == "e"
	    break 
	  else 
	    puts "The #{room} required no specific cleaning processes."#do you want to clean another room? (y/n)"
	  end
    end
    puts "Thank you!"	   
  end 
end
Clean_room.new.clean_room

#--------------------------------------------------------------
#Q2


def shopper_workflow
  orders = [{item:["apple", "orange", "milk"], distance: 6, pay: 10}, {item: ["egg", "grape", "pear", "broccoli"], distance: 10, pay: 20}]
  orders.each do |order|
    if accept_batch(order) == true
      item_details(order[:item])
      item_pickup(order[:item])
    end
  end
end


def accept_batch(order)
  puts "This order has #{order[:item].count} items, the distance is #{order[:distance]} and the pay is #{order[:pay]}"
    puts "do you want to accept the batch? (y/n)"
    answer = gets.chomp
    return true if answer == 'y' 
    return false
end

def item_details(order_items)
  puts "Order items:"
  puts "~" * 50
  order_items.each do |item|
    puts item
  end
  puts "~" * 50
  sleep(2)
end 

def item_pickup(order_items)
  puts "start to pick up items in the list"
  order_items.each do |item|
    puts "#{item} has been picked"
    sleep(2)
  end
  puts "~" * 50
  puts "all items have been picked up and order is ready for delivery!"
end


#----------------------------------------------------------------------
#Q3

def r_n
  play_again = "y"
  while play_again == "y"
    puts "select a random number between 1 to 10 or e to exit"
    random_number = rand(1..10) 
    hit = false
  
    while !hit
      answer = gets.chomp
      if answer.to_i.to_s != answer
        puts "please put a number"
      elsif answer == "e"
        break
      elsif answer.to_i > random_number
        puts "your guess is too high"
      elsif answer.to_i < random_number
        puts "your guess is too low"
      else
        puts "hit"
        hit = true
      end
    end

    puts "play again? (y/n)"
    play_again = gets.chomp
  end

  puts "Thanks for playing!"
end

r_n
#-------------------------------------------------------------------
#Q3 Bonus

def r_n
  play_again = "y"
  while play_again == "y"

    puts "select the min:"
    min = gets.chomp
    while min.to_i.to_s != min
      puts "please put a number"
      min = gets.chomp
    end

    puts "select the max:"
    max = gets.chomp
    while max.to_i.to_s != max
      puts "please put a number"
      max = gets.chomp
    end

    min = min.to_i
    max = max.to_i
    guess = (min+max)/2.floor
    tries = 1
    puts "select a random number between #{min} to #{max} for me"
    input = gets.chomp.to_i

    until guess == input
      if guess < input 
        puts "is it #{guess}?"
        puts "too low"
        min  = guess +1
        guess = rand(min..max)
        tries += 1
      end        
      if guess > input
        puts "is it #{guess}?"
        puts "too high"
        max = guess - 1
        guess = rand(min..max)
        tries += 1
      end
    end
    
    puts "is it #{guess}?"
    puts "yes, #{guess} is correct. you tried #{tries} times."
    puts "play again? (y/n)"
    play_again = gets.chomp
  end
  puts "Thanks for playing!"
end

r_n



