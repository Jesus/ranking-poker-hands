class CardSuit
  SUITS = %w(H D C S)

  def self.all_suits
    SUITS.map { |suit| new(suit) }
  end

  attr_reader :suit

  def initialize(suit)
    @suit = suit

    validate!
  end

  def ==(other)
    self.suit == other.suit
  end

protected

  def validate!
    raise ArgumentError, "Suit '#{@suit}' is invalid" unless suit_is_valid?
  end

  def suit_is_valid?
    SUITS.include? @suit
  end
end
