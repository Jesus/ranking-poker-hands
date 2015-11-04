require 'hand'

class PokerHand
  include Comparable

  attr_reader :hand

  def initialize(hand)
    case hand
    when Array
      @hand = Hand.new(hand)
    when Hand
      @hand = hand
    when PokerHand
      @hand = hand.hand
    else
      raise ArgumentError
    end
  end

  def casted
    self.class.poker_hand_types.each do |hand_type|
      hand = hand_type.new(self)
      return hand if hand.cards_match?
    end
  end

  def <=>(other)
    if self.class == other.class
      self.compare_with(other)
    else
      other.hand_type_index <=> self.hand_type_index
    end
  end

protected

# Returns the rank of the nth card sorted by rank asc
  def min_rank(n = 0)
    sorted_ranks[n]
  end

  # Returns the rank of the nth card sorted by rank desc
  def max_rank(n = 0)
    sorted_ranks.reverse[n]
  end

  def sorted_ranks
    @hand.cards.map(&:rank).sort
  end

  def x_of_a_kind_rank(x)
    CardRank::all_ranks.find { |rank| rank_count(rank) == x }
  end

  def suit_count(suit)
    @hand.cards.map(&:suit).count(suit)
  end

  def rank_count(rank)
    @hand.cards.map(&:rank).count(rank)
  end

  def is_flush?
    @hand.cards.all? { |card| card.suit == @hand.cards.first.suit }
  end

  def is_straight?
    sequence = %w(A 2 3 4 5 6 7 8 9 T J Q K A)
    possible_straights = sequence.size - (@hand.cards.size - 1)

    card_ranks = @hand.cards.map(&:rank)

    possible_straights.times do
      straight_ranks = sequence.take(5) # Line dedicated to Dave Brubeck
      straight_ranks.map! { |r| CardRank.new(r) }

      return true if straight_ranks.all? { |rank| card_ranks.include? rank }

      sequence = sequence.rotate
    end

    return false
  end

  def self.poker_hand_types
    [
      StraightFlush,
      FourOfAKind,
      FullHouse,
      Flush,
      Straight,
      ThreeOfAKind,
      TwoPair,
      OnePair,
      HighCard
    ]
  end

  def hand_type_index
    self.class.poker_hand_types.index(self.class)
  end
end
