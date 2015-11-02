require 'card'

class Hand
  attr_reader :cards

  def initialize(cards)
    raise ArgumentError, "Invalid amount of cards" if cards.length != 5

    @cards = cards.map {|card| Card.new(card)}
  end

  def min_rank
    @cards.map(&:rank).min
  end

  def max_rank
    @cards.map(&:rank).max
  end
end
