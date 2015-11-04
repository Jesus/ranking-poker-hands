class Straight < PokerHand
  def cards_match?
    is_straight?
  end

protected

  def compare_with(other)
    self.min_rank <=> other.min_rank
  end
end
