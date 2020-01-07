# Question 3. Guessing Game:
# Create a simple terminal program where the user guesses a randomly generated number.
# You'll want to look at other kinds of loops, the rand() method, and gets.chomp logic
# Bonus: REVERSE IT! Have the computer guess the user's input.
# MOAR Bonus: Look up how to implement a "binary search" to minimize the number of guesses the computer makes.

numero = rand(11)
loop do
    print "What is the number?"
    guess = gets.chomp
    if guess == "exit"
    break
    else
        if guess.to_i == numero
            puts "That's correct."
            break
        else
            puts "Guess again"
        end
    end
end



# REVERSE

def computer_guess
    number = 0
    loop do
        puts "Enter a number between 0 to 10"
        number = gets.chomp
        number = number.to_i
        if number > 10
            puts "Try again."
        else
            break
        end
    end
    loop do
        computer_number = rand(11)
        puts computer_number
        if computer_number == number
            puts "Computer guessed it."
            break
        else 
            puts "Try Again"
        end
    end 
end
    
