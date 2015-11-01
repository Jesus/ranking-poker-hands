class Card
  VALID_RANKS = %w(2 3 4 5 6 7 8 9 T J Q K A)
  VALID_SUITS = %w(H D C S)
  def initialize(card_identifier)
    @rank, @suit = card_identifier.chars

    validate!
  end

private

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
