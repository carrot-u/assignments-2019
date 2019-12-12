def random
  guess_this_number = rand(1..5)
  puts "Guess a number between 1 & 5"
  answer = gets.chomp.to_3
  until answer == guess_this_number do
    puts " Oh no..Try again!"
    answer = gets.chomp.to_3
  end
  puts "You got it Right :)!"
end
random
