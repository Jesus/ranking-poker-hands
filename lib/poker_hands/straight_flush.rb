require 'poker_hand'

class StraightFlush < PokerHand
  def matches?
    is_straight? and is_flush?
  end
end
