require 'poker_hand'

class Straight < PokerHand
  def cards_match?
    is_straight?
  end
end
