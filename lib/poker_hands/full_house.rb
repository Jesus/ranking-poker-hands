class FullHouse < PokerHand
  def cards_match?
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 3
    end && CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 2
    end
  end

protected

  def compare_with(other)
    diff = self.three_of_a_kind_rank <=> other.three_of_a_kind_rank

    if diff == 0 # tie
      self.pair_rank <=> other.pair_rank
    else
      diff
    end
  end

  def three_of_a_kind_rank
    x_of_a_kind_rank(3)
  end

  def pair_rank
    x_of_a_kind_rank(2)
  end
end
