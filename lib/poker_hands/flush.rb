class Flush < PokerHand
  def cards_match?
    is_flush?
  end

protected

  # In the event of a tie: The player holding the highest ranked card wins. If
  # necessary, the second-highest, third-highest, fourth-highest, and
  # fifth-highest cards can be used to break the tie. If all five cards are the
  # same ranks, the pot is split. The suit itself is never used to break a tie
  # in poker.
  def comparer_methods
    super + [
      :highest_rank,
      :second_highest_rank,
      :third_highest_rank,
      :fourth_highest_rank,
      :fifth_highest_rank
    ]
  end

  def highest_rank
    max_rank
  end

  def second_highest_rank
    max_rank(1)
  end

  def third_highest_rank
    max_rank(2)
  end

  def fourth_highest_rank
    max_rank(3)
  end

  def fifth_highest_rank
    max_rank(4)
  end
end
