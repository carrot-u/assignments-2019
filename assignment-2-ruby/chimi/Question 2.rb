# Question 2. Tiny Instacart!
# Compose a simple terminal program using one or more of the common objects from Instacart (orders, drivers, batches, order_items, payments, etc)
# Design a desired workflow. ex. The entire flow of a driver from accepting a batch to delivery
# Using the tools and concepts from the completed room cleaner program, construct a self-running terminal program that successfully runs through your intended workflow.
# Test your program thoroughly to ensure that it runs as expected.

# Possible Extensions:
# Ruby offers alternatives to if/else including unless, while, and until.
# Set parameters for your program through user input
# Make sure to incorporate if/else and the appropriate operators.
# Look up how to use a ruby hash to create an array with multiple attributes per array element and run an each loop that checks the values of said attributes. 
# ex. (`drivers = [{name: "Rose", role: "in-store-shopper"}, {name: "Donna", role: "shift-lead"}, {name: "Amelia Pond", role: "full-service"}, {name: "Martha Jones", role: "cashier"})

def customer_name
    customer_name = "A.B"
end

def customer_address
    customer_address = "50 Beale St, San Francisco, CA 94105."
end

def store_information
    store_information = "H-E=B. 11815 Westheimer Rd, Houston"
end

def grocery_list
    grocery_list = [{item: "Banana", quantity: 5}, {item: "Quaker's Oats", quantity: 2}, {item: "Fresh Squeezed Orage Juice", quantity: 1}]
end

def assistance
    puts "Please call CARE for assistance."
end

def batch_earnings
    puts "This is a full service batch with delivery to 1 customer."
    puts "Total Earnings: $23.57"
    puts "Batch Incentive: $11.35 "
    puts "Mileage: $8.22"
    puts "Tips: $5.00"
end

def offer_batch
    puts "We have a batch available."
    sleep (1)
    batch_earnings
    sleep (1)
    puts "Would you like to accept this batch? (y/n)"
    acceptance = gets.chomp
    if acceptance == "y"
        puts "Thanks for accepting the batch! \nPlease head to the store address provided. #{store_information}"
        sleep (1)
        puts "Heading to the store.."
        sleep (2)
    else
        puts "Good luck finding another batch."
        exit 
    end
end

def at_store
    puts "You are now at the store. \nHappy Shopping!"
    sleep (1)
end

def picking
    puts "Let's begin shopping for #{customer_name}"
    sleep (1)
    grocery_list.each do |value|
        puts "Were you able to find #{value} (y/n)?" 
        found = gets.chomp
        if found == "y"
            puts "The item has been marked as found."
            sleep (1)
        else 
            puts "Were you able to find a replacement (y/n)?"
            replacement = gets.chomp
            if replacement == "y"
                puts "Customer has been notified of replacement."
                sleep (1)
            else 
                puts "The customer has been refunded for the item."
                sleep (1)
            end
        end
    end
end

def checkout
    puts "Please head to checkout to pay for the order."
    sleep (1)
    puts "Please swipe your Instacart Marqeta Card."
    sleep (1)
    puts "Were you able to checkout with your payment card (y/n)?"
    transaction = gets.chomp
    if transaction == "y"
        puts "Please verify your receipt by taking a picture of the receipt."
        sleep (1)
    else
        "Sorry you had trouble checking out. \n1. Try swiping your card again. \n2. Try running the card as debit or credit. \n3,"
        assistance
        sleep (2)
        checkout
    end
end    

def delivery
    puts "Are you ready to deliver the batch (y/n)?"
    delivery_ready = gets.chomp
    if delivery_ready == "y" 
        puts "Customer Address is #{customer_address}"
        sleep (1)
        puts "Order is being delivered.."
        sleep (2)
        puts "You have reached the customer's location."
        sleep (2)
    else 
        assistance
        sleep (1)
        delivery
    end
end

def complete_batch
    puts "Did you drop off the order to the customer (y/n)?"
    delivered = gets.chomp
    if delivered == "y"
        puts "Thank you. The order is now complete."
    else
        puts "Is the customer is unavailable?"
        assistance
        sleep (1)
        complete_batch
    end
end
        
def batch_flow
    offer_batch
    at_store
    picking
    checkout
    delivery
    complete_batch
end
