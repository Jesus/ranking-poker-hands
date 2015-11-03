class StraightFlush < PokerHand
  def cards_match?
    is_straight? and is_flush?
  end
end
