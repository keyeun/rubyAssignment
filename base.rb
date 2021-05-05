require 'set'

def rand_n(n, max)
    randoms = Set.new
    loop do
        randoms << rand(max)
        return randoms.to_a if randoms.size >= n
    end
end

$sec = []
$sec = rand_n(4,10)
$attempt = 0
$start_time = Time.now

def guess(input)
    ball = 0
    strike = 0
    #guess_array 빈 array 생성
    guess_array = Array.new(4)
    #input값넣어주기
    guess_array = input
    secret_array = $sec

    for i in 0..3
        if secret_array[i] == guess_array[i]
            strike += 1
        elsif secret_array.include? guess_array[i]
            ball += 1
        end
    end
    return "#{strike}S#{ball}B"
end

while true do
    $attempt += 1
    puts "Guess the number. Tell me 4 digits number: "
    local = gets.chomp
    output = guess(local.each_char.map(&:to_i))
    puts output
    if output=="4S0B"
        puts "You are correct! Put your name here:"
        name = gets.chomp
        elapsed_time = Time.now - $start_time
        file = File.new("log.txt", "w")
        file.puts "Name: #{name}, Attempt: #{$attempt}, Time: #{elapsed_time}\n"
        file.close
        break
    end
end
