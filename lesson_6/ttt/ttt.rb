# frozen_string_literal: true

class Player
  def initialize(marker)
    @marker = marker
  end
end

class Human < Player
  attr_reader :name
  def initialize(marker)
    @name = set_name
    super(marker)
  end

  def to_string(available_squares)
    if available_squares.size > 2
      available_squares[0..-2].join(', ') + ", or #{available_squares.last}"
    else
      available_squares[0]
    end
  end

  def choose_from(options)
    choice = nil
    loop do
      puts "Choose from the following squares: #{to_string(options)}"
      choice = gets.chomp
      break if options.include?(choice.to_i)
    end
    choice.to_i
  end

  def set_name
    input = ''
    loop do
      puts 'Enter your name: '
      input = gets.chomp
      break unless input.empty?
    end
    input
  end
end

class Computer < Player
end

class Square
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end
end

class Board
  attr_reader :squares

  ROWS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]].freeze
  COLUMNS = [[1, 4, 7], [2, 5, 8], [3, 6, 9]].freeze
  DIAGONALS = [[1, 5, 9], [3, 5, 7]].freeze

  def initialize
    @squares = {}
    (1..9).each { |num| squares[num] = Square.new(' ') }
  end

  # rubocop:disable Metrics/AbcSize
  def display
    puts ' _________________'
    puts '|     |     |     |'
    puts "|  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}  |"
    puts '|_____|_____|_____|'
    puts '|     |     |     |'
    puts "|  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}  |"
    puts '|_____|_____|_____|'
    puts '|     |     |     |'
    puts "|  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}  |"
    puts '|_____|_____|_____|'
  end

  # rubocop:enable Metrics/AbcSize
  def get_marker_at(key)
    squares[key]
  end

  def set_marker_at(key, marker)
    squares[key] = Square.new(marker)
  end

  def available_squares
    squares.select { |_, square| square.marker == ' ' }.keys
  end

  def winner?(marker)
    [ROWS, COLUMNS, DIAGONALS].any? do |lines|
      lines.any? do |line|
        line.all? do |index|
          squares[index].marker == marker
        end
      end
    end
  end

  def full?
    (1..9).to_a.all? do |num|
      squares[num].marker == 'X' || squares[num].marker == 'O'
    end
  end
end

class Score
  attr_accessor :human_wins, :computer_wins
  def initialize
    @human_wins = 0
    @computer_wins = 0
  end
end

class TTTGame
  attr_accessor :move_count
  attr_reader :board, :human, :computer, :score

  def initialize
    welcome_message
    @human = Human.new('X')
    @computer = Computer.new('O')
    @board = Board.new
    @move_count = 0
    @score = Score.new
  end

  def play
    loop do
      board.display
      players_move
      clear_screen_and_display_board
      declare_winner
      declare_score
      break unless play_again?

      reset_game
    end
    goodbye_message
  end

  private

  def welcome_message
    puts 'Welcome to Tic-Tac-Toe!'
  end

  def goodbye_message
    puts 'Thanks for playing Tic-Tac-Toe!'
  end

  def clear_screen_and_display_board
    system('clear')
    board.display
  end

  def human_moves
    move_selection = human.choose_from(board.available_squares)
    board.set_marker_at(move_selection, 'X')
  end

  def computer_moves
    move_selection = board.available_squares.sample
    board.set_marker_at(move_selection, 'O')
  end

  def computer_or_player_moves
    move_count.even? ? human_moves : computer_moves
    self.move_count += 1
  end

  def players_move
    loop do
      computer_or_player_moves
      break if winner_or_full?

      clear_screen_and_display_board
    end
  end

  def winner_or_full?
    board.winner?('X') ||
      board.winner?('O') ||
      board.full?
  end

  def update_score(marker)
    self.score.human_wins += 1 if marker == 'X'
    self.score_computer_wins += 1 if marker == 'O'
  end

  def human_win
    puts "You won!"
    update_score('X')
  end

  def computer_win
    puts "The computer won!"
    update_score('O')
  end

  def declare_winner
    if board.winner?('X')
      human_win
    elsif board.winner?('O')
      computer_win
    else
      puts 'Tie game!'
    end
  end

  def declare_score
    puts "#{human.name} has #{score.human_wins}\nThe computer has #{score.computer_wins}."
  end

  def play_again?
    input = ''
    loop do
      puts 'Would you like to play again? (y/n)'
      input = gets.chomp
      break if %w[y n].include?(input)

      puts "I'm sorry, that input isn't valid."
    end
    input == 'y'
  end

  def reset_game
    @board = Board.new
    @move_count = 0
  end
end

game = TTTGame.new
game.play
