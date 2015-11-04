class StraightFlush < Straight
  def cards_match?
    super and is_flush?
  end
end
