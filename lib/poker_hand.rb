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

  # Each inheriting object is meant to implement a comparer for draws of two
  # hands of the same type.
  # def hand_matches?(hand)
  #   raise NotImplementedError,
  #     "Expected inheriting object to implement this method"
  # end

  def min_rank
    @hand.cards.map(&:rank).min
  end

  def max_rank
    @hand.cards.map(&:rank).max
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
    rank = self.min_rank
    @hand.cards.size.times do
      if rank.nil? or @hand.cards.all? {|card| card.rank != rank}
        return false
      end
      rank = rank.next
    end

    return true
  end

protected

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
