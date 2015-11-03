require 'poker_hand'

class OnePair < PokerHand
  def cards_match?
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 2
    end
  end
end
