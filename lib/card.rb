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

  def next
    next_rank = @rank.next

    if next_rank.nil?
      nil
    else
      # NOTE: We could improve performance sending the raw objects rather than
      #       their identifying strings to the card constructor.
      self.class.new("#{next_rank.rank}#{@suit.suit}")
    end
  end

  def prev
    prev_rank = @rank.prev

    if prev_rank.nil?
      nil
    else
      self.class.new("#{prev_rank.rank}#{@suit.suit}")
    end
  end
end
