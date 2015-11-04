class ThreeOfAKind < PokerHand
  def cards_match?
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 3
    end
  end

protected

  # In the event of a tie: Highest ranking three of a kind wins. In community
  # card games where players have the same three of a kind, the highest side
  # card, and if necessary, the second-highest side card wins.
  def comparer_methods
    super + [
      :three_of_a_kind_rank,
      :first_side_card_rank,
      :second_side_card_rank
    ]
  end

  def three_of_a_kind_rank
    x_of_a_kind_rank(3)
  end

  def first_side_card_rank
    side_cards.max
  end

  def second_side_card_rank
    side_cards.min
  end

  def side_cards
    @hand.cards.select { |card| card.rank != three_of_a_kind_rank }
  end
end
