module NewUser

    attr_accessor :name, :phone, :address
    
    def create_account
        puts "Welcome to Instacart!"
        print "\nWhat is your name? "
        @name = gets.chomp
        print "Hi, #{@name}! What is your phone number? "
        @phone = gets.chomp
        print "What is your address? "
        @address = gets.chomp
        puts "\nThank you! Your account has been created."
        puts "\n"
        puts "_" * 50
        puts "\tName: #{@name}"
        puts "\tPhone Number: #{@phone}"
        puts "\tAddress: #{@address}"
        puts "-" * 50
    end
end

module GroceryList

    attr_accessor :item_name, :item_brand, :item_quantity, :item_instructions

    def create_item
        print "\nWhat item would you like to add? "
        @item_name = gets.chomp
        print "What brand? "
        @item_brand = gets.chomp
        print "How many? "
        @item_quantity = gets.chomp.to_i
        print "Do you have additional instuctions? Choose Y for yes or N for no. "
        answer = gets.chomp
        case answer
        when "N", "n"
            @item_instructions = ""
        when "Y", "y"
            print "What are your additional instructions? "
            @item_instructions = gets.chomp
        else
            puts "You've selected an invalid option. Please try again."
            print "Do you have additional instuctions? Choose Y for yes or N for no. "
            answer = gets.chomp
        end
    end

    def add(attributes)
        $grocery_list ||= []
        item = new(attributes)
        $grocery_list.push(item)
        sleep 1
        puts "\nAdding #{item.attributes[:name]} to your order..."
        puts "Brand: #{item.attributes[:brand]}"
        puts "Quantity: #{item.attributes[:quantity]}"
        puts "Instructions: #{item.attributes[:instructions]}"
        sleep 1
    end

    def add_more
        print "\nWould you like to add another item? Choose Y for yes or N for no. "
        answer = gets.chomp
        case answer
        when "N", "n"
            "Okay! Finished adding items."
        when "Y", "y"
            puts "Okay! Lets add another item."
            Item.create_item
            @Item = Item.add(name: Item.item_name, brand: Item.item_brand, quantity: Item.item_quantity, instructions: Item.item_instructions)
            Item.add_more
        else
            puts "You've selected an invalid option. Please try again."
            add_more
        end
    end

    def review_list
        x = 0
        puts "\nLet's review your order!"
        puts "\n"
        sleep 1
        puts "-" * 50
        puts "Your Grocery List:"
        puts "-" * 50
        $grocery_list.each do |item|
            puts "#{x +=1}. #{item.attributes[:name]}"
            puts "\t Brand: #{item.attributes[:brand]}"
            puts "\t Quantity: #{item.attributes[:quantity]}"
            puts "\t Instructions: #{item.attributes[:instructions]}"
            end
        puts "-" * 50
        puts "\n"
    end
end

module Checkout

    def schedule_order
        print "What day this week would you like your order delivered? Choose any day Monday through Sunday. "
        day = gets.chomp
        print "What time #{day} would you like your order delivered? "
        time = gets.chomp
        puts "\n"
        print "Type C to confirm your delivery to #{User.address} on #{day} at #{time}. Type X to cancel. "
        answer = gets.chomp
        case answer
        when "X", "x"
            puts "Okay, your order has been discarded."
        when "C", "c"
            puts "\nCongratulations! You've saved #{rand(1..3)} hours by shopping with Instacart."
            puts "Your order has been placed for #{time} on #{day}."
            puts "Your shopper will call you at #{User.phone} when they arrive."
        else
            puts "You've selected an invalid option. Please try again."
            print "Type C to confirm your delivery to #{User.address} on #{day} at #{time}. Type X to cancel. "
            answer = gets.chomp
        end
    end
end

class User
    extend NewUser
    include Checkout
    attr_accessor :name, :phone, :address

    def initialize (name, phone, address)
        @name = name
        @phone = phone
        @address = address
    end

end

class Order
    include GroceryList
    attr_reader :store

    def initialize
        @store = store
    end

    def what_store
        print "\nWhat store would you like to order from? "
        store = gets.chomp
        puts"\n"
        puts "You are now ordering from #{store}."
    end
end

class Item
    extend GroceryList
    attr_reader :attributes

    def initialize(attributes)
        @attributes = attributes
    end
end

User.create_account
User1 = User.new(User.name, User.phone, User.address)
Order1 = Order.new
Order1.what_store
Item.create_item
Item1 = Item.add(name: Item.item_name, brand: Item.item_brand, quantity: Item.item_quantity, instructions: Item.item_instructions)
Item.add_more
sleep 1
Order1.review_list
sleep 1
User1.schedule_order
sleep 1
puts "\nThanks for shopping with Instacart!"



