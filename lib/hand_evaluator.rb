class HandEvaluator
  def return_stronger_hand(left, right)
    left_hand = PokerHand.new(left).casted
    right_hand = PokerHand.new(right).casted

    if left_hand > right_hand
      return left
    elsif right_hand > left_hand
      return right
    else
      raise "now what?"
    end
  end
end
