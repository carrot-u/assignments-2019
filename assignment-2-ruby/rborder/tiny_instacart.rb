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
  while stores.include?(selected_store) == false do
    print "\nSelect an available store: "
    selected_store = gets.chomp
  end
  return selected_store
end

def order
  workflow_state = "shopping"
  order_items = []
  puts "\nBrowse departments:"
  AISLES.each do |department|
    puts department + " | "
  end
  response = gets.chomp
end

def line_break
  "---------------------------"
end


# picking a delivery window
def delivery_window
  deliv = 0
  (1..5).each do |i|
    puts "Delivery within #{i} hour/s."
  end
  while deliv < 1
    print "Select from an available time: "
    deliv = gets.chomp.to_i
  end
  return deliv
end

def to_h(n)
  return n * 60 * 60
end

# delivery or pickup choice
def service_selection
  puts "Select a delivery time."
  service = delivery_window
  t = Time.now + to_h(service)
  puts "Your order will arrive by #{t}"
  return t
end

def customer_app
  puts line_break + "Welcome to Instacart!" + line_break
  puts "\nPlease select a store from available warehouses in your area: "
  warehouse = select_warehouse
  modality = service_selection
  puts "warehouse: #{warehouse}"
  puts "service: #{modality}"
end

# -------------------------------------------------
customer_app
