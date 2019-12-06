puts "Welcome to the guessing game!"

my_number = rand(100)
puts my_number
puts "I am thinking of an integer that between 0 and 100. Can ou guess what it is?"
guess = gets.chomp.to_i

until guess == my_number
	if guess < my_number
	puts "Nope! Hint: try a bigger number! "
	guess = gets.chomp.to_i
	elsif  guess > my_number
	puts "Nope! Hint: try a smaller number!"
	guess = gets.chomp.to_i
	end
end

puts "Ta-da! You guessed correctly!"