# Classy Tiny-Instacart
# Now that you've learned about objects and classes, use these concepts to rebuild your Tiny Instacart.
# orders, drivers, batches, order_items, payments
# Order, Item, User, Shopper
# Compose a simple terminal program using one or more of the common objects from Instacart (orders, drivers, batches, order_items, payments, etc)

# Design a desired workflow. ex. The entire flow of a driver from accepting a batch to delivery
# Using the tools and concepts from the completed room cleaner program, construct a self-running terminal program that successfully runs through your intended workflow.
# Test your program thoroughly to ensure that it runs as expected.
# Possible Extensions:

# Ruby offers alternatives to if/else including unless, while, and until.
# Set parameters for your program through user input
# Make sure to incorporate if/else and the appropriate operators.
# Look up how to use a ruby hash to create an array with multiple attributes per array element and run an each loop that checks the values of said attributes. ex. (`drivers = [{name: "Rose", role: "in-store-shopper"}, {name: "Donna", role: "shift-lead"}, {name: "Amelia Pond", role: "full-service"}, {name: "Martha Jones", role: "cashier"})

class User

  attr_accessor :first_name, :last_name, :delivery_address, :phone_number

  def initialize(firstname, lastname, address, phone)
      @first_name = firstname
      @last_name = lastname
      @delivery_address = address
      @phone_number = phone
  end

  def greet
      puts "Hi " + @first_name + " " + @last_name
  end

  def delivery_address
      puts "Your order will be delivered to " + @delivery_address
      puts "Your phone number is " + @phone_number
  end

end

class Store

  AVAILABLE_STORES = { "COSTCO" => "COSTCO Address", "HEB" => "HEB Address", "FOODLION" => "FOODLION Address" }

  def select_store
    puts "Please select from the available stores: "
    AVAILABLE_STORES.each_key { |k| puts k }
    # AVAILABLE_STORES.keys
    print "Your selection: "

    selected_store = gets.chomp.to_s
    puts "Welcome to " + selected_store + " at " + AVAILABLE_STORES[selected_store]
    return selected_store
  end

end

class Order
    STATUSES = ["new", "processing", "delivering", "complete"]

    def initialize(user)
        @user = user
        @status_index = 0
    end

    def status
        STATUSES[@status_index]
        if @status_index == 0
          puts "Order Received!"
        elsif @status_index == 1
          puts "Picking items ..."
        elsif @status_index == 2
          puts "Order is out for delivery!"
        elsif @status_index == 3
          puts "Order delivered! "
        else
          puts "Invalid Index!"
        end

    end

    def advance_status
        if @status_index < STATUSES.length() - 1
            @status_index += 1
            puts "Order Status Updated: " + STATUSES[@status_index]
        else
            puts "Complete order cannot be updated!"
        end
    end

end

def shopping_workflow
    my_user = User.new("David", "P.", "190 Liberty St, Toronto, ON M6K 3L5", "(437) 836-3082")
    my_user.greet

    my_store = Store.new()
    my_store.select_store

    my_user.delivery_address

    # order: new
    my_order = Order.new(my_user)
    puts my_order.status
    my_order.advance_status
    # order: processiing
    puts my_order.status
    my_order.advance_status
    # order: delivering
    puts my_order.status
    my_order.advance_status
    # order: complete
    puts my_order.status
end

shopping_workflow
