require "spec_helper"
require "poker_hands/three_of_a_kind"

describe ThreeOfAKind do
  describe "#cards_match?" do
    it "is true if the given hand has three of a kind" do
      poker_hands = [
        %w(5H 5H 3H 5H 9H),
        %w(6D 2S 5H 6H 6C),
        %w(AD 9S JH AH AC),
        %w(8D 8S 8H 2H 3C),
        %w(2S AS JS 2S 2S)
      ]

      poker_hands.each do |poker_hand|
        poker_hand = described_class.new(poker_hand)

        expect(poker_hand.cards_match?).to be_truthy
      end
    end

    it "is false if the given hand doesn't have three of a kind" do
      poker_hands = [
        %w(5H 6H 7D 8H 9D),
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
