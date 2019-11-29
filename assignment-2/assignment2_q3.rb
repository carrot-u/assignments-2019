=begin
3. Guessing Game:
Create a simple terminal program where the user guesses a randomly generated number.

Hints:

You'll want to look at other kinds of loops, the rand() method, and gets.chomp logic
Bonus: REVERSE IT! Have the computer guess the user's input.
MOAR Bonus: Look up how to implement a "binary search" to minimize the number of guesses the computer makes.
=end



def generate_random_num(lower, upper)
  return rand(lower..upper)
end

def define_scope
 puts "Lets set the limits for our guess"
 puts "Enter the lower limit and press enter when done"
 lower = gets.chomp
 puts "Got it. Enter the higher limit and press enter when done"
 upper = gets.chomp
 limits= [lower,upper]
 return limits
end


scope = define_scope
answer = generate_random_num(scope[0].to_i, scope[1].to_i)
last_guess = 0
guess_count = 0
count = 0
loop do
  puts "Make a guess!"
  guess = gets.chomp.to_i
  if guess == answer
    puts "#{answer} is correct! It took you #{guess_count}guesses."
    break
  else
    puts "#{guess} is not correct, please try again."
    guess_count += 1


    #last_guess = guess
    #if (count == 0)
    #  puts "#{guess} is not correct, please try again."
    #  count +=
    #end
    #elsif ((guess - answer).abs) < ((last_guess - answer).abs)
    #  puts "Incorrect but getting warmer!"
    #else
    #  puts "Incorrect and getting colder!"
    #end
    # last guess 8
    # answer = 4
    # current guess 2
    # 2- 4 = -2, 8-4 = 4
  end
end
