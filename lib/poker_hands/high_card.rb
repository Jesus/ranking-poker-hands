require 'poker_hand'

class HighCard < PokerHand
  def cards_match?
    true
  end
end
