class StraightFlush < PokerHand
  def cards_match?
    is_straight? and is_flush?
  end

protected

  def compare_with(other)
    self.max_rank <=> other.max_rank
  end
end
