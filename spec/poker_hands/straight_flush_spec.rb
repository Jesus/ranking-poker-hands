require "spec_helper"
require "poker_hands"

describe StraightFlush do
  describe "#<=>" do
    it "returns -1 if the receiver is smaller" do
      receiver = described_class.new(%w(5H 6H 7H 8H 4H))
      other    = described_class.new(%w(5H 6H 7H 8H 9H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns 1 if there receiver is greater" do
      receiver = described_class.new(%w(TH 6H 7H 8H 9H))
      other    = described_class.new(%w(5H 6H 7H 8H 9H))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 0 if there's a draw" do
      receiver = described_class.new(%w(5H 6H 7H 8H 9H))
      other    = described_class.new(%w(5H 6H 7H 8H 9H))

      expect(receiver<=>(other)).to eq(0)
    end
  end

  describe "#cards_match?" do
    it "is true if the given hand has a straight flush" do
      poker_hands = [
        %w(5H 6H 7H 8H 9H),
        %w(6H 2H 3H 4H 5H),
        %w(4S 5S 2S 3S AS),
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
