require 'card_rank'
require 'card_suit'

class Card
  include Comparable

  attr_reader :rank, :suit

  def initialize(card_identifier)
    rank, suit = card_identifier.chars

    @rank = CardRank.new(rank)
    @suit = CardSuit.new(suit)
  end

  def <=>(other)
    self.rank <=> other.rank
  end
end
