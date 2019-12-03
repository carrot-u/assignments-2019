def divide
    puts "-" * 50
end

def batch_notification
    earnings = rand(10.05..25.33)
    batch_incentive = earnings * 0.50
    mileage = earnings * 0.30
    tip = earnings * 0.20
    puts "\nYou have a batch!"
    puts "This is a Full Service batch with 1 order."
    puts "\t#{rand(10..20)} items"
    puts "\t#{rand(20..30)} units"
    puts "\tEstimated Earnings: " + "$" + sprintf('%.2f', earnings)
    puts "\tBatch Incentive: " + "$" + sprintf('%.2f', batch_incentive)
    puts "\tMileage: " + "$" + sprintf('%.2f', mileage)
    puts "\tTip: " + "$" + sprintf('%.2f', tip)
end

def ask(question)
    print question + " "
    answer = gets.chomp
    if answer == "no"
        puts "\nSearching for more batches..."
        sleep(2)
        puts batch_notification
        ask(question)
    else answer == "yes"
        puts "You have accepted this batch!"
    end
end

def navigate(place)
    sleep(1)
    divide
    puts "The #{place} is #{rand(2..6)} miles away."
    puts "Navigating to #{place}..."
    sleep(2)
    puts "You have arrived at the #{place}."
end

def shop
    sleep(1)
    divide
    puts "Let's start shopping!"
    sleep(1)

    grocery = ["produce", "pantry", "refrigerated", "frozen"]

    grocery.each do |section|
        puts "Shopping for #{section} items..."
        sleep(2)
        puts "You have shopped for all #{section} items."
        sleep(1)
    end

    puts "You are done shopping! Please proceed to checkout."
end

def checkout
    sleep(1)
    divide
    puts "Let's pay for this order!"
    sleep(1)
    puts "Swiping Instacart Payment Card..."
    sleep(2)
    puts "Approved!"
    sleep(1)
    puts "You have completed the checkout process. Please proceed to delivery."
end

def deliver
    sleep(1)
    divide
    puts "It's time to deliver this order to the customer!"
    sleep(1)
    puts "Delivering order..."
    sleep(2)
    puts "The order has been delivered. Great job!"
end


def complete_batch
    batch_notification
    ask("Would you like to accept? Choose yes or no. ")
    navigate("store")
    shop
    checkout
    navigate("customer's address")
    deliver
end

def continue_shift
    sleep(1)
    divide
    print "Would you like to keep working? Select yes or no. "
    answer = gets.chomp
end

puts "\nWelcome to the Instacart Shopper App!"
sleep(1)
complete_batch
answer = continue_shift
while answer == "yes"
    puts "\nSearching for more batches..."
    sleep(2)
    complete_batch
    answer = continue_shift
end

puts "\nThank you for shopping with Instacart! Your shift is now over."




