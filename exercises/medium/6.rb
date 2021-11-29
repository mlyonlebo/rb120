class GuessingGame
  attr_reader :number, :min, :max
  attr_accessor :guess_count, :win
  
  def initialize(min, max)
    @min = min
    @max = max
    @guess_count = compute_guess_count
    @number = rand(min..max)
    @win = false
  end

  def remaining_guesses
    puts "You have #{guess_count} guesses remaining."
  end

  def compute_guess_count
    Math.log2(max - min).to_i + 1
  end

  def get_guess
    input = nil
    loop do
      puts "Enter a number between #{min} and #{max}"
      input = gets.chomp.to_i
      break if input >= min && input <= max
      puts "Invalid guess."
    end
    input
  end

  def win?
    self.win = true
  end

  def evaluate(guess)
    if number > guess
      puts "Your guess is too low"
    elsif number < guess
      puts "Your guess is too high"
    elsif guess == number
      puts "That's the number!"
      win?
    end
  end

  def turn
    remaining_guesses
    evaluate(get_guess)
  end

  def result
    puts self.win ? "You won!" : "You have no more guesses. You lost!"
  end

  def play
    loop do
      break if guess_count == 0 || self.win
      turn
      self.guess_count -= 1
    end
    result
  end
end


game = GuessingGame.new(501, 1500)
game.play
=begin
You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
=end