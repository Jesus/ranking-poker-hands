class FullHouse < PokerHand
  def cards_match?
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 3
    end && CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 2
    end
  end

protected

  # In the event of a tie: Highest three matching cards wins the pot. In
  # community card games where players have the same three matching cards,
  # the highest value of the two matching cards wins.
  def comparer_methods
    super + [
      :three_of_a_kind_rank,
      :pair_rank
    ]
  end

  def three_of_a_kind_rank
    x_of_a_kind_rank(3)
  end

  def pair_rank
    x_of_a_kind_rank(2)
  end
end
