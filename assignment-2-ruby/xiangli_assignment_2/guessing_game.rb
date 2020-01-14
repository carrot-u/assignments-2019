puts "Guessing Game Starts Now!"
random_number = rand(10)

puts "Pick a number between 0 and 10: "
guess = gets.chomp.to_i


until guess == random_number
	if guess <= 10 && guess >= 0
		puts "Try again!"
	else 
		puts "Out of Range. Please pick a number between 0 and 10."
	end
	guess = gets.chomp.to_i
end

puts "You got it!"
