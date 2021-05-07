def welcome_message
  puts "Welcome to cocktail vending machine! \n We have negroni, Gin Tonic, Mojito,  "
end

def bye_message
  puts "ByeBye"
end


class Cocktail
  attr_accessor :count
  attr_accessor :input
  def initialize(name,count)
    @name = name
    @count = count
  end
  def welcome
      puts "Do you want #{@name}? If you want, type y and if you don't, type n: "
  end
  def reduce(input)
      @count -= 1
  end
  def see
    puts "#{@count}"
  end
  def increase
    @count += 5
  end
  def log(input)
    puts "Tell me your name: "
    guest = gets.chomp
    #log = File.open("C:\Users\kieun.DESKTOP-6N1FJDR\Documents\Web Development\rubyAssignment\logs.txt","a")
    #log.puts "Name: #{name}, Buy: #{@name}"
    #log.close
  end
end

$negroni = Cocktail.new("Negroni",1)
$gin = Cocktail.new("Gin Tonic",0)
$mojito = Cocktail.new("Mojito",0)
$sexon = Cocktail.new("Sex on the Beach",0)

$cocktail_array = [$negroni,$gin,$mojito,$sexon]

class Machine
  def run
    welcome_message
    if $negroni.count != 0
    $negroni.welcome
    local_1 = gets.chomp
    if local_1 != "n"
    $negroni.reduce(local_1)
    $negroni.log(local_1)
    end
    end

    if $gin.count != 0
    $gin.welcome
    local_2 = gets.chomp
    if local_2 != "n"
    $gin.reduce(local_2)
    end
    end

    if $mojito.count != 0
    $mojito.welcome
    local_3 = gets.chomp
    if local_3 != "n"
    $mojito.reduce(local_3)
    end
    end

    if $sexon.count != 0
    $sexon.welcome
    local_4 = gets.chomp
    if local_4 != "n"
    $sexon.reduce(local_4)
    end
    end

    $sexon.see
  end

  def fill
    if $negroni.count == 0 && $gin.count == 0 && $mojito.count == 0 && $sexon.count == 0
      $negroni.increase
      $gin.increase
      $mojito.increase
      $sexon.increase
      log = File.open("logs.txt","r")
      content = log.read
      puts content
      log.close
    end
  end
end

mac = Machine.new
Dir.getwd
mac.run
mac.fill
