require "spec_helper"
require "poker_hands/straight"

describe Straight do
  describe "#cards_match?" do
    it "is true if the given hand has straight" do
      poker_hands = [
        %w(5H 4H 6H 3H 7H),
        %w(TS 9S QS KS JS),
        %w(JH QH KH AH TH),
        %w(6S 5S 4S 3S 2S)
      ]

      poker_hands.each do |poker_hand|
        poker_hand = described_class.new(poker_hand)

        expect(poker_hand.cards_match?).to be_truthy
      end
    end

    it "is false if the given hand doesn't have straight" do
      poker_hands = [
        %w(5H 5H 7H 7H 9D),
        %w(6H 2H 3D 4H 3H),
        %w(TS 9H 8H 7H QH),
        %w(5S 6S 7S 9C 9S),
        %w(8S KS JS QH TS)
      ]

      poker_hands.each do |poker_hand|
        poker_hand = described_class.new(poker_hand)

        expect(poker_hand.cards_match?).to be_falsey
      end
    end
  end
end
