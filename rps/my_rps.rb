class Move

  attr_reader :value
  
  WINNING_COMBOS = {
                    'rock' => 'scissors',
                    'scissors' => 'paper',
                    'paper' => 'rock'
                    }

  def initialize(value)
    @value = value
  end

  def to_s
    @value  
  end

  def beats?(opponent)
    WINNING_COMBOS[self.value] == opponent.value
  end

end


class Player
  attr_accessor :name, :move
  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    input = ''
    loop do 
      puts "Please enter your name: "
      input = gets.chomp
      break unless input.empty?
    end
    self.name = input
  end

  def set_move
    choice = nil
    loop do
      puts "Choose a move! Rock, paper, or scissors: "
      choice = gets.chomp.downcase
      break if %w[rock paper scissors].include?(choice)
      puts "I'm sorry, that's not a valid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['John Wayne', 'Bruce Lee', 'Charmander', 'Hephaestus', 'Snyder The Insolent Goose'].sample
  end

  def set_move
    self.move = Move.new(%w(rock paper scissors).sample)
  end
end


class Engine
  attr_accessor :human, :computer
  def initialize
    welcome_message
    @human = Human.new
    @computer = Computer.new
  end

  def welcome_message
    puts "Welcome to rock, paper, scissors!"
  end

  def choose_moves
    human.set_move
    computer.set_move
  end

  def report_choices
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end
  
  def determine_winner
    if human.move.beats?(computer.move)
      puts "You beat #{computer.name}, #{human.name}!"
    elsif computer.move.beats?(human.move)
      puts "You lost to #{computer.name}, #{human.name}!"
    else
      puts "Tie!"
    end
  end

  def play_again?
    input = ''
    loop do 
      puts "Do you want to play again? (y/n): "
      input = gets.chomp.downcase
      break unless input.empty?
    end
    input == 'y'
  end


  def play
    loop do
      choose_moves
      report_choices
      determine_winner
      break unless play_again?
      puts "Thanks for playing!"
    end
  end
end

Engine.new.play