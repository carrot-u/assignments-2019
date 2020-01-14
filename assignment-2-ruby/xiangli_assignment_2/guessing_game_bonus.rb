puts "Guessing Name Starts Now!"
puts "Pick a number between 0 and 10: "
num = gets.chomp

# is integer??
until num.is_a?(Integer) && num <= 10 && num >= 0 
	puts "Out of Range. Please pick a number between 0 and 10. "
	num = gets.chomp.to_i
end

guess = -1
num_try = -1

puts "Computer starts guessing."

until guess == num
	if guess != -1
		puts "trying #{guess}"
	end
	guess = rand(10)
	num_try += 1
end
puts "*" * 40
puts "Computer tried #{num_try} times. It's #{guess}."







