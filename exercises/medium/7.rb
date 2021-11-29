class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def rank_to_i
    if rank.class == Integer
      return rank
    elsif rank == 'Jack'
      return 11
    elsif rank == 'Queen'
      return 12
    elsif rank == 'King'
      return 13
    elsif rank == 'Ace'
      return 14
    end
  end

  def <=>(other)
    rank_to_i <=> other.rank_to_i
  end

  def ==(other)
    self.rank_to_i == other.rank_to_i
  end
end

# class Card
#   include Comparable
#   attr_reader :rank, :suit

#   VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end

#   def value
#     VALUES.fetch(rank, rank)
#   end

#   def <=>(other_card)
#     value <=> other_card.value
#   end
# end

a = Card.new(2, 'Hearts')
cards = [a,
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
b = Card.new(2, 'Hearts')
p a
p b
p a == b
# puts cards
# puts cards.min 
# p cards.min
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max
# p cards.max
# puts cards.max == Card.new('Ace', 'Clubs')

=begin
cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')


cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
=end