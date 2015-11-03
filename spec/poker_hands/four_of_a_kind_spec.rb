require "spec_helper"
require "poker_hands"

describe FourOfAKind do
  describe "#<=>" do
    it "returns -1 if the receiver is smaller" do
      receiver = described_class.new(%w(5H 5H 5H 5H AH))
      other    = described_class.new(%w(6H 6H 6H 6H 9H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (with kicker)" do
      receiver = described_class.new(%w(5H 5H 5H 5H 3H))
      other    = described_class.new(%w(5H 5H 5H 5H 9H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns 1 if there receiver is greater" do
      receiver = described_class.new(%w(TH TH TH TH 9H))
      other    = described_class.new(%w(7H 7H 7H 7H 9H))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 1 if there receiver is greater (with kicker)" do
      receiver = described_class.new(%w(TH TH TH TH 9H))
      other    = described_class.new(%w(TH TH TH TH 3C))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 0 if there's a draw" do
      receiver = described_class.new(%w(TH TH TH TH 3S))
      other    = described_class.new(%w(TH TH TH TH 3C))

      expect(receiver<=>(other)).to eq(0)
    end
  end

  describe "#cards_match?" do
    it "is true if the given hand has four of a kind" do
      poker_hands = [
        %w(5H 5H 5H 5H 9H),
        %w(6D 6S 5H 6H 6C),
        %w(AD AS JH AH AC),
        %w(2S 2S JS 2S 2S)
      ]

      poker_hands.each do |poker_hand|
        poker_hand = described_class.new(poker_hand)

        expect(poker_hand.cards_match?).to be_truthy
      end
    end

    it "is false if the given hand doesn't have four of a kind" do
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
