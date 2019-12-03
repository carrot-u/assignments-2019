def ask(question)
    print question
    answer = gets.chomp
end


number = rand(1..5)
puts "I'm thinking of a number between 1 and 5"
loop do
    user_guess = ask("What number am I thinking of? ")
    if user_guess.to_i == number
        puts "You guessed the number! Great job!"
        break
    else
        puts "Sorry, that's not it!"
        sleep(1)
        answer = ask("Would you like to guess again? Choose yes or no. ")
            if answer == "yes"
                puts "Okay! Guess again."
            else
                puts "Okay! The number was #{number}. Thanks for playing!"
                break
            end
    end
end