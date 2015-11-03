require 'poker_hand'

class Flush < PokerHand
  def cards_match?
    is_flush?
  end
end
