require 'hand'

class PokerHand
  def initialize(hand)
    case hand
    when Array
      @hand = Hand.new(hand)
    when Hand
      @hand = hand
    else
      raise ArgumentError
    end

    # TODO: raise ArgumentError if the given hand doesn't match the given game.
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

  def is_straight?
    @hand.cards.all? { |card| card.suit == @hand.cards.first.suit }
  end

  def is_flush?
    rank = self.min_rank
    @hand.cards.size.times do
      if rank.nil? or @hand.cards.all? {|card| card.rank != rank}
        return false
      end
      rank = rank.next
    end

    return true
  end
end
