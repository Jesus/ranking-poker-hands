require 'poker_hand'

class ThreeOfAKind < PokerHand
  def cards_match?
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 3
    end
  end
end
