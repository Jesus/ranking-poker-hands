require "spec_helper"
require "poker_hands"

describe StraightFlush do
  describe "#cards_match?" do
    it "is true if the given hand has a straight flush" do
      poker_hands = [
        %w(5H 6H 7H 8H 9H),
        %w(6H 2H 3H 4H 5H),
        %w(TH 9H 8H 7H 6H),
        %w(5S 6S 7S 8S 9S),
        %w(AS KS JS QS TS)
      ]

      poker_hands.each do |poker_hand|
        poker_hand = described_class.new(poker_hand)

        expect(poker_hand.cards_match?).to be_truthy
      end
    end

    it "is false if the given hand doesn't have a straight flush" do
      poker_hands = [
        %w(5H 6H 7H 8H 9D),
        %w(6H 2H 3H 4H 3H),
        %w(TH 9H 8H 7H QH),
        %w(5S 6S 7S 9S 9S),
        %w(8S KS JS QS TS)
      ]

      poker_hands.each do |poker_hand|
        poker_hand = described_class.new(poker_hand)

        expect(poker_hand.cards_match?).to be_falsey
      end
    end
  end
end
