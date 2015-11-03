require 'card_rank'
require 'card_suit'

class Card
  include Comparable

  attr_reader :rank, :suit

  def initialize(*args)
    case args.map(&:class)
    when [String]
      init_from_string(*args)
    when [CardRank, CardSuit]
      init_from_rank_and_suit(*args)
    else
      raise ArgumentError
    end
  end

  def <=>(other)
    self.rank <=> other.rank
  end

  def next
    next_rank = @rank.next

    if next_rank.nil?
      nil
    else
      self.class.new(next_rank, @suit)
    end
  end

  def prev
    prev_rank = @rank.prev

    if prev_rank.nil?
      nil
    else
      self.class.new(prev_rank, @suit)
    end
  end

  def inspect
    "#{rank.inspect}#{suit.inspect}"
  end

protected

  def init_from_string(card_identifier)
    raise ArgumentError if card_identifier.length != 2

    rank, suit = card_identifier.chars

    @rank = CardRank.new(rank)
    @suit = CardSuit.new(suit)
  end

  def init_from_rank_and_suit(rank, suit)
    @rank = rank
    @suit = suit
  end
end
