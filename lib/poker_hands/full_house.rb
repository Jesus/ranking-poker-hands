require 'poker_hand'

class FullHouse < PokerHand
  def cards_match?
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 3
    end && CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 2
    end
  end
end
