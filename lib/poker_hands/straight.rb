class Straight < PokerHand
  def cards_match?
    is_straight?
  end

protected

  # In the event of a tie: Highest ranking card at the top of the sequence
  # wins.
  def comparer_methods
    super + [
      :min_rank
    ]
  end
end
