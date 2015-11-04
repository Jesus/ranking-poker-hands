class OnePair < PokerHand
  def cards_match?
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 2
    end
  end

protected

  def comparer_methods
    super + [
      :pair_rank,
      :first_side_card_rank,
      :second_side_card_rank,
      :third_side_card_rank
    ]
  end

  def pair_rank
    x_of_a_kind_rank(2)
  end

  def first_side_card_rank
    sorted_side_cards[2]
  end

  def second_side_card_rank
    sorted_side_cards[1]
  end

  def third_side_card_rank
    sorted_side_cards[0]
  end

  def sorted_side_cards
    @hand.cards.select { |card| card.rank != pair_rank }.sort
  end
end
