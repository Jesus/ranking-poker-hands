require 'poker_hand'

class FourOfAKind < PokerHand
  def cards_match?
    CardRank::RANKS.any? do |rank|
      rank = CardRank.new(rank)
      rank_count(rank) >= 4
    end
  end
end
