class Card
  include Comparable

  VALID_RANKS = %w(2 3 4 5 6 7 8 9 T J Q K A)
  VALID_SUITS = %w(H D C S)

  attr_reader :rank, :suit

  def initialize(card_identifier)
    @rank, @suit = card_identifier.chars

    validate!
  end

  def <=>(other)
    if self.suit == other.suit
      self.rank_as_integer <=> other.rank_as_integer
    else
      nil
    end
  end

protected

  def rank_as_integer
    VALID_RANKS.index @rank
  end

  def validate!
    raise ArgumentError, "Rank '#{@rank}' is invalid" unless rank_is_valid?
    raise ArgumentError, "Suit '#{@suit}' is invalid" unless suit_is_valid?
  end

  def rank_is_valid?
    VALID_RANKS.include? @rank
  end

  def suit_is_valid?
    VALID_SUITS.include? @suit
  end
end
