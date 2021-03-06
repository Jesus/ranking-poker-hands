require "spec_helper"
require "poker_hands"

describe Straight do
  describe "#<=>" do
    it "returns -1 if the receiver is smaller" do
      receiver = described_class.new(%w(5H 4D 3H 2H AH))
      other    = described_class.new(%w(5S 6C 7H 8H 9H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns 1 if there receiver is greater" do
      receiver = described_class.new(%w(JH QH AS KH TH))
      other    = described_class.new(%w(5H 6C 7D 8H 9H))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 0 if there's a draw" do
      receiver = described_class.new(%w(5H 6C 7C 8S 9H))
      other    = described_class.new(%w(5C 6C 7H 8D 9H))

      expect(receiver<=>(other)).to eq(0)
    end
  end

  describe "#cards_match?" do
    it "is true if the given hand has straight" do
      poker_hands = [
        %w(5H 4H 6H 3H 7H),
        %w(TS 9S QS KS JS),
        %w(JH QH KH AH TH),
        %w(5H 4H 3H 2H AH),
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
