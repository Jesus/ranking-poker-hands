require 'poker_hand'

class TwoPair < PokerHand
  def cards_match?
    first_pair_rank = nil
    CardRank::all_ranks.any? do |rank|
      rank_count(rank) == 2 && first_pair_rank = rank
    end && (CardRank::all_ranks.delete_if{|r|r == first_pair_rank}).any? do |rank|
      rank_count(rank) == 2
    end
  end
end
