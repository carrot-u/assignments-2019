# in-store shopper Fulfillment 

items = ["apple", "orange juice", "ice_cream", "eggs"]


def shopper_fulfilling(item)
	puts "Shopper found #{item}."
	sleep(1)
end

def shopper_checkout
	sleep(5)
	puts "Shopper successfully checked out."
	puts "-" * 40
end

def temperature_control
	sleep(5)
	puts "Your items have been temprature controlled. Order Completed."
	puts "-" * 40
end

def order_fulfillment(items)
	puts "Shopper acceppted your order. "
	puts "Order Details: #{items}"
	puts "-" * 40
	sleep(1)

	puts "Shopper starts shopping now."
	items.each do |item|
		shopper_fulfilling(item)
	end

	puts "-" * 40
	sleep(1)
	
	puts "Shopper found all items. Checking out now."
	shopper_checkout

	sleep(1)

	temperature_control
end



order_fulfillment(items)