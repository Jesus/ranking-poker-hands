class Straight < PokerHand
  def cards_match?
    is_straight?
  end

protected

  def comparer_methods
    super + [
      :min_rank
    ]
  end
end
