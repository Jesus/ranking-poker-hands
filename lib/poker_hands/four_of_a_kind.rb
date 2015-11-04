class FourOfAKind < PokerHand
  def cards_match?
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 4
    end
  end

protected

  # In the event of a tie: Highest four of a kind wins. In community card
  # games where players have the same four of a kind, the highest fifth side
  # card ('kicker') wins.
  def comparer_methods
    super + [
      :four_of_a_kind_rank,
      :kicker_rank
    ]
  end

  def four_of_a_kind_rank
    x_of_a_kind_rank(4)
  end

  def kicker_rank
    x_of_a_kind_rank(1)
  end
end
