# frozen_string_literal: true

require 'pry'

class Player
  def hit?
    input = ''
    loop do
      puts 'Hit or stay? (h/s)'
      input = gets.chomp
      break if input.downcase == 'h' || input.downcase == 's'

      puts 'You are valid, friend, but that choice is not.'
    end
    input == 'h'
  end
end

class Dealer; end

class Deck
  attr_reader :cards
  attr_accessor :player_hand, :dealer_hand

  NEW_DECK = { 'A' => 4, '2' => 4, '3' => 4,
               '4' => 4, '5' => 4, '6' => 4,
               '7' => 4, '8' => 4, '9' => 4,
               '10' => 4, 'J' => 4, 'Q' => 4,
               'K' => 4 }.freeze

  def initialize
    @cards = NEW_DECK
    @player_hand = deal_hand
    @dealer_hand = deal_hand
  end

  def shuffle_and_select_card
    shuffled_deck = []
    cards.each do |rank, quantity|
      quantity.times do
        shuffled_deck << rank
      end
    end
    shuffled_deck.sample
  end

  def remove_from_deck!(card)
    cards[card] -= 1
  end

  def deal_card
    card = shuffle_and_select_card
    remove_from_deck!(card)
    Card.new(card)
  end

  def deal_hand
    Hand.new(deal_card, deal_card)
  end

  def display_table
    display(dealer_hand, true)
    display(player_hand)
    puts "You have #{player_hand.total}."
  end

  def display(hand, dealer_hand = false)
    cards = hand.ranks
    cards[0] = ' ' if dealer_hand
    strings = ['', '', '', '', '', '', '', '']
    cards.each do |card|
      strings[1] += ' ______ '
      strings[2] += "|#{card}#{' ' * (5 - (card.length - 1))}|"
      strings[3] += '|      |'
      strings[4] += '|      |'
      strings[5] += "|#{'_' * (5 - (card.length - 1))}#{card}|"
    end
    puts strings
  end

  def hit(hand)
    hand.cards << deal_card
    display_table
  end
end

class Hand
  attr_accessor :cards, :card_count

  def initialize(card1, card2)
    @cards = [card1, card2]
    @card_count = 2
  end

  def ranks
    cards.map(&:rank)
  end

  def non_aces_total
    total = 0
    ranks.each do |rank|
      if rank.to_i != 0
        total += rank.to_i
      elsif %w[J Q K].include?(rank)
        total += 10
      end
    end
    total
  end

  def total
    total = non_aces_total
    if ranks.include?('A')
      total += total > 10 ? 1 : 11
    end
    total
  end
end

class Card
  attr_reader :rank

  def initialize(rank)
    @rank = rank
  end
end

class TwentyOne
  attr_reader :deck, :player
  attr_accessor :player_busts, :dealer_busts

  def initialize
    @deck = Deck.new
    @player = Player.new
    @player_busts = false
    @dealer_busts = false
  end

  def play
    welcome_message
    deck.display_table
    player_turn
    dealer_turn
    declare_winner
    goodbye_message
  end

  private

  def welcome_message
    puts 'Welcome to Twenty One!'
  end

  def goodbye_message
    puts 'Thanks for playing Twenty One! Goodbye!'
  end

  def under_21?(hand)
    hand.total <= 21
  end

  def player_busts!
    self.player_busts = true
    puts 'You bust!'
  end

  def dealer_busts!
    self.dealer_busts = true
    puts 'The dealer busts!'
  end

  def player_turn
    while under_21?(deck.player_hand)
      if player.hit?
        deck.hit(deck.player_hand)
      else
        return
      end
      deck.display_table
    end
    player_busts!
  end

  def dealer_turn
    while deck.dealer_hand.total < 17
      deck.hit(deck.dealer_hand)
      deck.display_table
    end
    dealer_busts! unless under_21?(deck.dealer_hand)
  end

  def player_won?
    deck.player_hand.total > deck.dealer_hand.total
  end

  def declare_winner
    if dealer_busts
      puts 'You win!'
    else
      puts "The dealer has #{deck.dealer_hand.total}."
      puts player_won? ? 'You win!' : 'You lose!'
    end
  end
end

TwentyOne.new.play
