class BatchProcessor
    STORES = ["H.E.B.", "Publix", "Kroger", "Food Lion", "Ingles", "Harris Teeter", "Aldi", "Lidl", "Piggly Wiggly"]
    ITEMS = {apples: 5, carrots: 4, bread: 3, peaches: 8, jalapenos: 1, eggs: 3, dog_food: 15, cat_food: 9, chicken: 8, ground_beef: 5, crackers: 3, brie: 8, salami: 8, la_croix: 4
    }
    SLEEP_DURATION = 1
  
    attr_accessor :shopper_name
  
    def initialize
    end
  
    def run
      accept_batch
    end
  
    def grocery_list
        list_length = ITEMS.length
        grocery_list = ITEMS.keys.sample(rand(list_length))
        grocery_list
      end
    
      def grocery_store
          grocery_store = STORES.at(rand(9))
          grocery_store
      end
      def price
          price = 0
          ITEMS.values.each do |cost|
              price += cost
          end
          price
      end
  
    def get_shopper_name
        shopper_name = gets.chomp
        @shopper_name = shopper_name
    end
  
    def ask_for_input(question)
      puts "#{question} (y/n)"
    end
  
    def accept_batch
      puts "🥕🥕🥕Welcome to Instacart! 🥕🥕🥕"
      puts "Who is Shopping today? "
      name = get_shopper_name
      puts "Hello #{name}!"
      ask_for_input("A new batch is available. Do you accept?")
      get_answer do |answer|
        if answer == 'n'
          puts "Goodbye"
          break
        elsif answer == 'y'
            then shopping_trip
            break
        else
            ask_for_input("Invaild option. Do you accept?")
        end
      end
    end
  
    def shopping_trip
      store = grocery_store
      puts "Please head to #{store} to collect your batch."
      sleep(SLEEP_DURATION)
      ask_for_input("Have you arrived at #{store}?")
      get_answer do |answer|
        if answer == 'n'
            puts "Please let us know when you arrive."
            ask_for_input("Have you arrived at #{store}?")
        elsif answer == 'y'
            then shopper_batch(store)
            break
        else
            ask_for_input("Invaild option. Have you arrived?")
        end
      end
    end
  
    def shopper_batch(store)
        puts "Please collect the following items for the customer: "
        sleep(SLEEP_DURATION)
        puts grocery_list
        sleep(SLEEP_DURATION)
        ask_for_input("Are all items collected from #{store}?")
        get_answer do |answer|
          if answer == 'n'
              puts "Please collect all items."
              ask_for_input("Have you collected all items?")
          elsif answer == 'y'
              break
          else
              ask_for_input("Invaild option. Have all items been collected?")
          end
        end
        sleep(SLEEP_DURATION)
        puts "$" * 40
        puts "Please remit payment of $#{price}."
        sleep(SLEEP_DURATION)
        sleep(SLEEP_DURATION)
        puts "💵Payment received!💵"
        puts "Please proceed to customer's location."
        sleep(SLEEP_DURATION)
        puts "Opening Google Maps to take you to customer's location..."
        sleep(SLEEP_DURATION)
        puts "*" * 40
        sleep(SLEEP_DURATION)
        sleep(SLEEP_DURATION)
        sleep(SLEEP_DURATION)
        delivery
    end
  
    def delivery
      puts "You have arrived at the customer's location!"
      sleep(SLEEP_DURATION)
      ask_for_input("Have you delivered batch to the customer?")
      get_answer do |answer|
   sleep(SLEEP_DURATION)
        if answer == 'n'
            puts "Well, no time like the present!"
            ask_for_input("Have you delivered batch to the customer?")
        elsif answer == 'y'
            break
        else
            ask_for_input("Invaild option. Has the batch been delivered?")
        end
      end
      sleep(SLEEP_DURATION)
      puts "🎉🎉Congrats! You have completed a batch!🎉🎉"
      sleep(SLEEP_DURATION)
   sleep(SLEEP_DURATION)
      puts "Wow! The customer tipped you 20%!"
      puts "You have received $#{price * 0.2}!"
   sleep(SLEEP_DURATION)
      sleep(SLEEP_DURATION)
      puts "Have a great day, #{@shopper_name}!"
      puts "🥕" * 20
   sleep(SLEEP_DURATION)
    end
  
    def get_answer
      loop do
        yield gets.chomp
      end
    end
  
  end
  
  BatchProcessor.new.run