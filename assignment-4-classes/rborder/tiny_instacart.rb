require 'yaml'
require 'time'

module OrderWorkflow
  def select_warehouse(warehouses)
    selected_store = ""
    puts "Select which store you would like to shop from today."
    warehouses.each { |store| print "| #{store} |" }
    puts "\n"
    while !warehouses.include?(selected_store) do
      print "\nSelect an available store: "
      selected_store = gets.chomp
    end
    @warehouse = selected_store
  end

  def aisle_prompt(aisles)
    puts "\nBrowse departments:"
    aisles.each do |department|
      print "| #{department} |"
    end
    puts "\n" * 2
  end

  def build_order(catalog, aisles)
    @state = "in_progress"
    basket_items = []
    aisle_prompt(aisles)
    response = gets.chomp
    puts "Use 'q' to exit the order building process.\n"
    until response == "q"
      if aisles.include?(response)
        puts "Select from the following in stock items: "
        catalog.item_list.each do |item|
          puts "#{item.name}" if item.aisle == response
        end
        basket_items.append(gets.chomp)
      end
      puts "\n"
      puts " Select another aisle to browse or enter 'q' to exit: "
      aisle_prompt(aisles)
      response = gets.chomp
    end
    @basket = basket_items
  end

  def delivery_window
    deliv = 0
    (1..5).each do |i|
      puts "Delivery within #{i} hour/s."
    end
    while deliv < 1
      print "\nSelect from an available time (int): "
      deliv = gets.chomp.to_i
    end
    @delivery_option = deliv
  end

  def shopping(catalog)
    puts "Your shopper is now shopping your order."
    found_items = []
    unfound_items = []
    item_names = catalog.item_list.collect { |i| i.name }
    for item in @basket
      if item_names.include?(item)
        found_items.append(item)
      else
        unfound_items.append(item)
      end
    end
    unfound_items.each do |item|
      puts "#{item} could not be found. If a suitable replacement does not exist, the item will be refunded."
    end
    @basket = found_items
    basket_size = 0
    @basket.each { |item| basket_size += catalog.search_item_price(item) }
    @total = basket_size
    @state = "shopped"
  end

  def delivering
    puts "Shopping is now completed and your order is expected to arrive at #{}!.\n"
    @delivery_option.times do
      print "."
      sleep 0.5
    end
    puts "Your order has arrived."
    @state = "delivered"
  end

  def receipt(order)
    order.basket.each { |i| puts }
  end
end

 class OrderItem
   attr_accessor :name, :aisle, :price

   def initialize(name, aisle, price)
     @name = name
     @aisle = aisle
     @price = price
   end
 end

class Catalog
  attr_accessor :item_list
  def initialize
    @item_list = Array.new
  end

  def upload_catalog(list)
    @item_list = list
  end

  def load_catalog
    list = YAML.load_file("catalog.yml")
    list.each do |i|
      item = OrderItem.new(i[:name],i[:aisle],i[:cost])
      @item_list.push(item)
    end
  end

  def search_item_price(name)
    result = 0
    @item_list.each { |i| result += i.price if name == i.name }
    return result
  end
end

class Order
  include OrderWorkflow

  attr_reader :warehouse, :order_id, :basket, :total, :delivery_option, :created_at
  attr_accessor :total

  def initialize(order_id)
    @warehouse = ""
    @order_id = order_id
    @basket = []
    @total = 0
    @state = "new"
    @created_at = Time.now
    @delivery_option = 0
    @estimated_delivery_time = @created_at + @delivery_option
  end
end

class Customer
  attr_reader :first_name, :last_name, :created_at, :num_orders, :address

  def initialize(first_name, last_name, address)
    @first_name = first_name
    @last_name = last_name
    @created_at = Time.now
    @address = address
    @num_orders = 0
    @orders = []
  end

  # generic greetings to use at different points in order flow
  def greet_customer(name_style)
    case name_style
    when "first"
      puts "Welome back #{first_name}!"
    when "full"
      puts "Welcome back #{first_name} #{last_name}!"
    when "new"
      puts "We're glad to have you on boards. Let's go farther together."
    end
  end

  def to_s
    puts "#{first_name} #{last_name} was signed up on #{created_at} and has placed #{num_orders} orders. "
  end

  # adds orders to users profile
  def add_order(order_id)
    @num_orders += 1
    @orders.push(order_id)
    puts "#Order ID: #{order_id} has been added to #{first_name}'s order history."
  end

  def get_order_id
    return @num_orders += 1
  end

  def save_order(order)
    File.open("orders.yml", "r+") do |f|
      f.write(order.to_yaml)
    end
  end
end


class App
  attr_accessor :customer

  def initialize
    @customer = nil
  end

  def start_app
    unless File.exists?("customer_app.yml")
      File.new("customer_app.yml", "w+")
    end
    @customer = YAML.load_file("customer_app.yml")
  end

  def save_app(customer)
    @customer = customer

    File.open("customer_app.yml", "r+") do |f|
      f.write(@customer.to_yaml)
    end
  end

  def customer_check
    case @customer
    when false
      print "Please enter your first name: "
      first_name = gets.chomp
      print "Please enter your last name: "
      last_name = gets.chomp
      print "Please enter your full address: "
      address = gets.chomp
      customer = Customer.new(first_name, last_name, address)
      customer.greet_customer("new")
      return customer
    else
      @customer.greet_customer("first")
      return @customer
    end
  end
end

warehouses = ["Aldi","Kroger","Sprouts","Publix"]
aisles = ['Produce','Dairy & Eggs','Meat & Seafood','Snacks','Deli','Frozen Foods','Bulk','Household','Bakery']


# instantiate app and start app to check for existing yaml file
puts "Loading Instacart!"
sleep 0.5
customer_app = App.new
customer_app.start_app
catalog = Catalog.new
catalog.load_catalog

# instantiate customer
customer = customer_app.customer_check

# begin order building process
order_in_progress = Order.new(customer.get_order_id)
customer.save_order(order_in_progress)
order_in_progress.select_warehouse(warehouses)
customer.save_order(order_in_progress)
order_in_progress.build_order(catalog, aisles)
customer.save_order(order_in_progress)
order_in_progress.delivery_window
customer.save_order(order_in_progress)
order_in_progress.shopping(catalog)
customer.save_order(order_in_progress)



customer.add_order(order_in_progress.order_id)

customer_app.save_app(customer)
