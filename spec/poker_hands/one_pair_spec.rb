require "spec_helper"
require "poker_hands/one_pair"

describe OnePair do
  describe "#cards_match?" do
    it "is true if the given hand has a pair" do
      poker_hands = [
        %w(5H 5H 4H 2H 3H),
        %w(6D 5S 3H 4H 6C),
        %w(AD AS JH 2H 9C),
        %w(2S 2S AS KS 3S)
      ]

      poker_hands.each do |poker_hand|
        poker_hand = described_class.new(poker_hand)

        expect(poker_hand.cards_match?).to be_truthy
      end
    end

    it "is false if the given hand doesn't have a pair" do
      poker_hands = [
        %w(5H 4H 7H 3H 9D),
        %w(6H 2H 9H AH 3H),
        %w(TH 9H 8H 7H QH),
        %w(5S 6S 7S 8S 9S),
        %w(8S KS JS QS TS)
      ]

      poker_hands.each do |poker_hand|
        poker_hand = described_class.new(poker_hand)

        expect(poker_hand.cards_match?).to be_falsey
      end
    end
  end
end
