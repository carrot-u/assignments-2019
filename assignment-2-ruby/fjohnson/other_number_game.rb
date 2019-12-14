def ask(question)
    print question
    answer = gets.chomp
end

puts "I bet I can guess what number you're thinking of!"
number = ask("Type in any number between 1 and 5. I promise I won't peek! ")
loop do
    computer_guess = rand(1..5)
    puts "Is your number #{computer_guess}?"
    sleep(1)
    if computer_guess == number.to_i
        puts "Hooray, I win!"
        break
    else
        puts "Darn! That's not it!"
        sleep(1)
        answer = ask("Can I try again? Choose yes or no. ")
        if answer == "no"
            puts "Thanks for playing!"
            break
        end
    end
end
