require 'card'

class Hand
  def initialize(cards)
    raise ArgumentError, "Invalid amount of cards" if cards.length != 5

    @cards = cards.map {|card| Card.new(card)}
  end
end
