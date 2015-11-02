require 'hand'

class PokerHand
  # Each inheriting object is meant to implement a comparer for draws of two
  # hands of the same type.
  def self.hand_matches?(hand)
    raise NotImplementedError,
      "Expected inheriting object to implement this method"
  end
end
