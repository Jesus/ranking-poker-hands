class FullHouse < PokerHand
  def cards_match?
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 3
    end && CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 2
    end
  end

protected

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
