class CardSuit
  SUITS = %w(H D C S)

  def initialize(suit)
    @suit = suit

    validate!
  end

protected

  def validate!
    raise ArgumentError, "Suit '#{@suit}' is invalid" unless suit_is_valid?
  end

  def suit_is_valid?
    SUITS.include? @suit
  end
end
