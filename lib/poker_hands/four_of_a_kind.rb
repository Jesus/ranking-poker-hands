class FourOfAKind < PokerHand
  def cards_match?
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 4
    end
  end

protected

  def compare_with(other)
    diff = self.four_of_a_kind_rank <=> other.four_of_a_kind_rank

    if diff == 0 # tie
      self.kicker_rank <=> other.kicker_rank
    else
      diff
    end
  end

  def four_of_a_kind_rank
    CardRank::all_ranks.find { |rank| rank_count(rank) == 4 }
  end

  def kicker_rank
    CardRank::all_ranks.find { |rank| rank_count(rank) == 1 }
  end
end
