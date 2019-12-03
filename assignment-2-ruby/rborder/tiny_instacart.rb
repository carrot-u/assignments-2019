require './order_items_data'
require 'time'

# CUSTOMER APP

# select a store
def select_warehouse
  selected_store = ""
  stores = ['Kroger','Publix','Aldi','Sprouts']
  stores.each do |store|
    print "| #{store} |"
  end
  puts "\n"
  while !stores.include?(selected_store) do
    print "\nSelect an available store: "
    selected_store = gets.chomp
  end
  selected_store
end

def aisle_prompt
  puts "\nBrowse departments:"
  AISLES.each do |department|
    print "| #{department} |"
  end
  puts "\n" * 2
end

def order
  workflow_state = "shopping"
  order_items = []
  aisle_prompt
  response = gets.chomp
  puts "Use 'q' to exit the order building process.\n"
  until response == "q"
    if AISLES.include?(response)
      puts "Select from the following in stock items: "
      ITEMS.each do |item|
        puts "#{item[:name]}" if item[:aisle] == response
      end
      order_items.append(gets.chomp)
    end
    puts "\n"
    line_break
    puts " Select another aisle to browse or enter 'q' to exit: "
    aisle_prompt
    response = gets.chomp
  end
  return order_items
end

def line_break
  puts "---------------------------"
end


# picking a delivery window
def delivery_window
  deliv = 0
  (1..5).each do |i|
    puts "Delivery within #{i} hour/s."
  end
  while deliv < 1
    print "\nSelect from an available time (int): "
    deliv = gets.chomp.to_i
  end
  return deliv
end

def to_h(n)
  return n * 60 * 60
end

# delivery or pickup choice
def service_selection
  service = delivery_window
  t = Time.now + to_h(service)
  puts "Your order will arrive by #{t}"
  return t
end

def shopping(list)
  puts "Your shopper is now shopping your order."
  found_items = []
  unfound_items = []
  item_names = ITEMS.collect { |i| i[:name] }
  for item in list
    if item_names.include?(item)
      found_items.append(item)
    else
      unfound_items.append(item)
    end
  end
  unfound_items.each do |item|
    puts "#{item} could not be found. If a suitable replacement does not exist, the item will be refunded."
  end
  return found_items
end

def customer_app
  puts ("*" * 20) + "Welcome to Instacart!" + ("*" * 20)
  puts "\nPlease select a store from available warehouses in your area: "
  warehouse = select_warehouse
  sleep 0.5
  line_break
  modality = service_selection
  sleep 0.5
  line_break
  basket = order
  sleep 0.5
  line_break
  found = shopping(basket)
  sleep 0.5
  line_break
  puts "Shopping is complete.\nYour order from #{warehouse} is scheduled to be delivered at #{modality}"
end

# -------------------------------------------------
customer_app
