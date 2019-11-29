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
    sleep(1)
    puts "..."
    loop do
      puts "You have a new batch! Enter Yes to accept or No to decline"
      answer = gets.chomp
      if answer.downcase == "yes"
        puts 'Lets get started!'
        break
      elsif answer.downcase == "no"
        puts 'You have failed to accept the batch! Please wait for the next batch'
      puts "..."
      sleep(1)
      end
    end
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
    else
      puts "Leave a message for the customer that the batch has been left at the door"
      break
    end
  end
end


accept_batch
deliver_batch
customer_receive
