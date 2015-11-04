class Flush < PokerHand
  def cards_match?
    is_flush?
  end

protected

  def compare_with(other)
    n = 0
    loop do
      diff = self.max_rank(n) <=> other.max_rank(n)
      n += 1

      return diff if diff != 0 or n >= 5
    end
  end
end
