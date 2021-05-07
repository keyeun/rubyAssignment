$secret_array = Array.new(4) {rand(0..9)}
ball = 0
strike = 0

def guess_message
  puts "Guess the number. Tell me 4 digits number: "
end

def count()
  ball = 0
  if guess_array[0] == (secret_array[1]||secret_array[2]||secret_array[3])
    ball +=1;
  end
end

def guess
  secret_array = Array.new(4) {rand(0..9)}
  guess_array = Array.new(4)
  guess_message
  guess_array = gets.chomp
  puts guess_array[0]
  count
  if secret_array[0] == guess_array[0] || secret_array[1] == guess_array[1] || secret_array[2] == guess_array[2] || secret_array[3] == guess_array[3]
    strike += strike
  elsif guess_array[0] == (secret_array[1]||secret_array[2]||secret_array[3]) ||  guess_array[1] == (secret_array[0]||secret_array[2]||secret_array[3]) ||  guess_array[2] == (secret_array[1]||secret_array[0]||secret_array[3]) || guess_array[3] == (secret_array[1]||secret_array[2]||secret_array[0])
    ball += ball
  else
    puts secret_array
  end
  puts strike
  puts ball
end

guess
