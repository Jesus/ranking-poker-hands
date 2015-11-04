class HighCard < PokerHand
  def cards_match?
    true
  end

protected

  # In the event of a tie: Highest card wins, and if necessary, the
  # second-highest, third-highest, fourth-highest and smallest card can be
  # used to break the tie.
  def comparer_methods
    super + [
      :first_high_card,
      :second_high_card,
      :third_high_card,
      :fourth_high_card,
      :fifth_high_card
    ]
  end

  def first_high_card;  max_rank(0); end
  def second_high_card; max_rank(1); end
  def third_high_card;  max_rank(2); end
  def fourth_high_card; max_rank(3); end
  def fifth_high_card;  max_rank(4); end
end
