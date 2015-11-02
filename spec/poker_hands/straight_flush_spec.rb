require "spec_helper"
require "poker_hands/straight_flush"

describe StraightFlush do
  describe "::hand_matches?" do
    it "is true if the given hand has a straight flush" do
      matching_poker_hands = [
        %w(5H 6H 7H 8H 9H),
        %w(6H 2H 3H 4H 5H),
        %w(TH 9H 8H 7H 6H),
        %w(5S 6S 7S 8S 9S),
        %w(AS KS JS QS TS)
      ]

      matching_poker_hands.each do |poker_hand|
        poker_hand = Hand.new(poker_hand)
        expect(described_class.hand_matches?(poker_hand)).to be_truthy
      end
    end

    it "is false if the given hand doesn't have a straight flush"
  end
end
