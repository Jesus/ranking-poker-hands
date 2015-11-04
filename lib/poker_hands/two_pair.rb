class TwoPair < PokerHand
  def cards_match?
    first_pair_rank = nil
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 2 && first_pair_rank = rank
    end && (CardRank::all_ranks.delete_if{|r|r == first_pair_rank}).any? do |rank|
      rank_count(rank) == 2
    end
  end

protected

  # In the event of a tie: Highest pair wins. If players have the same highest
  # pair, highest second pair wins. If both players have two identical pairs,
  # highest side card wins.
  def comparer_methods
    super + [
      :highest_pair_rank,
      :lowest_pair_rank,
      :side_card_rank
    ]
  end

  def highest_pair_rank
    x_of_a_kind_ranks(2).max
  end

  def lowest_pair_rank
    x_of_a_kind_ranks(2).min
  end

  def side_card_rank
    x_of_a_kind_rank(1)
  end
end
