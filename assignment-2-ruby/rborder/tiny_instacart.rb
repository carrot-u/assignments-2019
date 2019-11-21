# SHOPPER APP

# presented with possible batches
def accept_batch
  return nil
end

# shopping animation and replacements
def shop
  return nil
end

# driving animation and scan bags?
def deliver
  return nil
end

# run shopper workflow
def shopper_app
  return nil
end

# --------------------------------------------------

# CUSTOMER APP

# select a store
def select_warehouse
  selected_store = ""
  stores = ['Kroger','Publix','Aldi','Sprouts']
  stores.each do |store|
    puts "#{store}"
  end
  while stores.downcase.include?(selected_store) == false do
    puts "Select an available store"
    selected_store = gets.chomp.downcase
    if selected_store

    end
  end
end

def order
  return nil
end

# delivery or pickup choice
def service_selection
  return nil
end

def customer_app
  return nil
end

# -------------------------------------------------

def select_workflow
  puts ""
end

select_warehouse
