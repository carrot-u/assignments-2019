# Guessing Game:
# Create a simple terminal program where the user guesses a randomly generated number.

# Hints:

# You'll want to look at other kinds of loops, the rand() method, and gets.chomp logic
# Bonus: REVERSE IT! Have the computer guess the user's input.
# MOAR Bonus: Look up how to implement a "binary search" to minimize the number of guesses the computer makes.


def generate_random_number(x)
    return rand(x)
end

def ask_question(question, x)
    max_num = (x - 1).to_s
    print question + max_num + ": "
end

def get_answer()
    return gets.chomp.to_i
end

# the user guesses a randomly generated number
def guessing_game(x)
    puts "Welcome to the guessing game!"
    random_number = generate_random_number(x)
    ask_question("Please enter a number that is between 0 and ", x)
    answer = get_answer()
    until answer == random_number do
        if answer > random_number
            ask_question("Your guess is bigger than the hidden number. Please enter a number that is between 0 and ", x)
            answer = get_answer()
        else
            ask_question("Your guess is smaller than the hidden number. Please enter a number that is between 0 and ", x)
            answer = get_answer()
        end
    end
    puts "Hit!"
end

# the computer guess the user's inpu
def guess_user_input(x, limit)
    ask_question("Please enter a number that is between 0 and ", x)
    answer = get_answer()
    guess = generate_random_number(x)
    count = 0
    while count < limit do
        if answer == guess
            puts "Hit!"
            return answer
        else
            puts "#{guess} is not correct. "
            ask_question("Let's try again with a number that is between 0 and ", x)
            guess = generate_random_number(x)
        end
        count += 1
    end
end

# iterative implementation of binary search in Ruby
def guessing_game_binary_search(max_num, guess)
    first = 0
    last = max_num - 1

    while first <= last
        i = (first + last) / 2

        if i == guess
            puts "Hit! The number is #{i}"
            return i
        elsif i > guess
            last = i - 1
        elsif i < guess
            first = i + 1
        end
    end
end
