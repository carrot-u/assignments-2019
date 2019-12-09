#welcome the user
#check that their name exist in the system
#place order
#pick from popular
#popular is an array
#pick a delievery time
#submit order
#order happens
#thank you

users = ["bob","felix","mike",'katrina']
welcome = "Welcome to TinyCarrot, let's order some groceries!"
ask_name = "What is your name?"


def ask(question)
	puts question + " "
	gets.chomp.downcase
end

def thank_you(user)
	puts "Thank you #{user} for using TinyCarrot"
	exit
end

def order
	order_items = []
	produce = { "Apple" => 1.0, "Bananas" => 1.25, "Oranges" => 3.50 }
	sandwiches = { "Veggie" => 5.75, "Turkey" => 6.0, "Beef sandwich" => 6.50 }

	puts "\n","In the produce department we have:"
	for key in produce.keys()
	    print key, " $", produce[key], "\n"
	end

	puts "\n","In the sandwiches department we have:","\n"
	for key in sandwiches.keys()
	    print key, " $", sandwiches[key], "\n"
	end
  	
  	puts "You may select up to 5 items. If you are finished earlier, just type 'done'."
 	10.times do
    	item_name = gets.chomp
    	break if item_name == 'done'
    	order_items << item_name
  	end
  	
  	puts "Great thanks! Here is your list!"
  	order_items.each do |item|
    	puts item
 	end
end

def check_user(user)
  users = ["bob","felix","mike",'katrina']
	if users.include? user
		puts "\n","We found you, #{user}.","\n", "Let's start shopping!"
	else
		puts "Sorry. You don't have an account. Let's make one."
		#exit for now, add_user method later
		exit
	end
end

def wait
	puts "*" + "-*" * 10
	sleep (2)
	puts "Done!" 
end

def place_order
	puts "Your order is being send to a shopper"
	puts "What time do you want it to be delievered?"
	time = gets.chomp
	puts "Your order has been placed. It will be delievered at #{time}"
	puts "Shopper is shopping for your products"
	wait
	puts "Shopper is paying"
	wait
	puts "Shopper is  driving"
	wait
	puts "Shopper has dropped the groceries off!"
	
end


puts welcome
user = ask(ask_name)
check_user(user)
order
place_order	
thank_you(user)
