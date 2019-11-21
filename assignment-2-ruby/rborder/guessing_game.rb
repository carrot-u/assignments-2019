# same robot from the room-cleaner app
def robot
  sleep 1

  puts "         _______ "
  puts "       _/       \\_  "
  puts "      / |       | \\  "
  puts "     /  |__   __|  \\  "
  puts "    |--(( )| |( ))--|  "
  puts "    |      | |      |  "
  puts "    |\\     |_|     /|  "
  puts "    | \\           / |  "
  puts "     \\| /  ___  \\ |/  "
  puts "      \\ | / _ \\ | /  "
  puts "       \\_________/  "
  puts "        _|_____|_  "
  puts "   ____|_________|____  "
  puts "  /                   \\  "

  sleep 1
end

# user guess
def user_guess(num)
  goal = rand(1..num)
  puts "The number has been set. Do your best!"
  counter = 0
  guess = 0
  until guess == goal do
    guess = gets.chomp.to_i
    if guess > goal
      puts "lower"
    elsif guess < goal
      puts "higher"
    else
      puts "Success!"
    end
    counter +=1
  end
  puts "You completed the game in #{counter} tries."
end

# random guess search
def compu_guess_random
  goal = 0
  counter = 0
  guess = 0
  print "Please provide a number between 1 and 100: "
  until goal > 0 do
    goal = gets.chomp.to_i
    if goal == 0
      puts "Please provide a valid number, idiot."
    elsif goal < 0
      puts "Nice try, but it needs to be a positive number."
    else
      puts "The game will now begin"
    end
  end
  puts "I will begin guessing with a random strategy!"
  until guess == goal do
    guess = rand(1..100)
    puts "I guess that the number is #{guess}."
    sleep 0.1
    counter += 1
  end
  puts "I was able to win your game and it only took me #{counter} tries."
end

# linear guess search
def compu_guess_linear
  goal = 0
  guess = 0
  print "Please provide a number between 1 and 100: "
  until goal > 0 do
    goal = gets.chomp.to_i
    if goal == 0
      puts "Please provide a valid number, idiot."
    elsif goal < 0
      puts "Nice try, but it needs to be a positive number."
    else
      puts "The game will now begin"
    end
  end
  puts "I will begin guessing with a linear strategy!"
  until guess == goal do
    guess += 1
    puts "I guess that the number is #{guess}."
    sleep 0.1
  end
  puts "I was able to win your game and it only took me #{guess} tries."
end


# linear binary search
def compu_guess_binary
  first = 1
  last = 100
  counter = 0
  goal = 0
  print "Please provide a number between 1 and 100: "
  until goal > 0 do
    goal = gets.chomp.to_i
    if goal == 0
      puts "Please provide a valid number, idiot."
    elsif goal < 0
      puts "Nice try, but it needs to be a positive number."
    else
      puts "The game will now begin"
    end
  end
  puts "I will begin guessing with a binary search strategy!"
  while first <= last
    midpoint = (first + last) / 2
    if midpoint == goal
      return "I am becometh, death, finder of numbers. #{midpoint} was foolish of you to pick."
    elsif midpoint < goal
      first = midpoint + 1
    else
      last = midpoint - 1
    end
    counter += 1
    puts "I guess that the number is #{midpoint}."
  end
  puts "The number is #{midpoint} and it only took me #{counter} tries."
end

# formatting methods
def line_break
  puts "*" * 40
end

# prompts for valid number in difficult selection
def get_number
  while 0 != nil
    puts "Please select a positive integer to set the difficulty."
    num = gets.chomp.to_i
    if num == 0
      puts "Is this what you call a number?"
    elsif num < 0
      puts "You aren't good a following instructions."
    else
      return num
    end
  end
end

# gives the user option to select from availale games
def game_select
  line_break
  puts "\n"
  puts "Available Games:"
  puts "\n"
  puts "Classic - Human vs CPU"
  puts "Reversed - CPU vs Human"
  puts "\n"

  selection = gets.chomp.downcase
  if selection == "classic"
    max_range = get_number
    user_guess(max_range)
  elsif selection == "reversed"
    line_break
    puts "Select the skill level of the CPU."
    puts "Low - Random Search"
    puts "Medium - Linear Search"
    puts "Expert - Binary Search"
    puts "\n"
    difficulty = gets.chomp.downcase
    if difficulty == "low"
      robot
      puts "My supreme intellect is grandiloquent."
      compu_guess_random
    elsif difficulty == "medium"
      robot
      puts "I have witnessed 14 million possible timelines, and in all of them you lose."
      compu_guess_linear
    elsif difficulty == "expert"
      robot
      puts "The end is nigh."
      result = compu_guess_binary
      puts result
    else
      puts "Not a valid difficulty. Try low, medium or expert."
    end
  else
    puts "Exiting"
  end
end

game_select
