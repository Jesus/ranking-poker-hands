require 'poker_hand'

class FourOfAKind < PokerHand
  def cards_match?
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 4
    end
  end
end
