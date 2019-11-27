def classic
    random_number = Random.new.rand(20)
loop do
  print "Guess the number between 0 and 20 (e to exit): "
  answer = gets.chomp
  if answer == "e"
    puts "The number was #{random_number}."
    break
  else
    if answer.to_i == random_number
      puts "You guessed correctly!"
      break
    elsif
        answer.to_i > random_number
        puts "Too high. Try again."
    elsif
        answer.to_i < random_number
      puts "Too low. Try again."
    end
  end
end
end

##############################Liner Guessing#####################################

def pick_number(input)
    number = ""
    loop do
        number = gets.chomp
        if number == "e"
            break
        elsif number.to_i > input
            puts "Invalid input. Try again."
        elsif number.to_i < 1
            puts "Invalid input. Try again."
        else
            puts "Thank you!"
            break
        end
    end
    return number.to_i
end

def linear
    puts "Select max value:"
    max = gets.chomp.to_i
    puts "Enter a number between 1 and #{max} (e to exit): "  
    guess = ""
    guess = guess.to_i
    number = pick_number(max)
    loop do
        guess = guess + 1
        puts guess
        sleep(0.5)
        if guess > number
            puts "Too high. Try again."
        elsif guess < number
            puts "Too low. Try again."
        elsif number == guess
            break
        end
    end
    sleep(1)
    puts "Correct! The number is #{number}!"
    sleep(0.2)
    puts "Thanks for playing!"
end

##############################Binary Guessing#####################################



def binary
    puts "Select max value:"
    max = gets.chomp.to_i
    min = 0
    puts "Enter a number between #{min} and #{max} (e to exit): "  
    guess = ""
    guess = guess.to_i
    number = pick_number(max)
    loop do
        guess = (min + max)/2
        puts guess
        sleep(0.5)
        if guess > number
            puts "Too high. Try again."
            max = guess - 1
        elsif guess < number
            puts "Too low. Try again."
            min = guess + 1
        elsif number == guess
            break
        end
    end
    sleep(1)
    puts "Correct! The number is #{number}!"
    sleep(0.2)
    puts "Thanks for playing!"
end

puts "Choose guessing game (classic, linear, binary)"
game = gets.chomp
if game == "binary"
    then binary
elsif game == "linear"
    then linear
elsif game == "classic"
    then classic
else "invalid selection"
end