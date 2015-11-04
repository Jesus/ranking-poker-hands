require "spec_helper"
require "poker_hands"

describe ThreeOfAKind do
  describe "#<=>" do
    it "returns -1 if the receiver is smaller" do
      receiver = described_class.new(%w(KH KH KH 3H TH))
      other    = described_class.new(%w(AH AH AH 2H 3H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (with tie)" do
      receiver = described_class.new(%w(KH KH KH 4C 3S))
      other    = described_class.new(%w(KH KH KH TH 9H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns 1 if there receiver is greater" do
      receiver = described_class.new(%w(TH 3H 2H TH TH))
      other    = described_class.new(%w(7H 7H 7H 6H 9H))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 1 if there receiver is greater (with tie)" do
      receiver = described_class.new(%w(TH TH TH AH 9H))
      other    = described_class.new(%w(TH TH TH JH 3C))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 0 if there's a draw" do
      receiver = described_class.new(%w(TH TH TS AH 9H))
      other    = described_class.new(%w(TH TH TH AH 9C))

      expect(receiver<=>(other)).to eq(0)
    end
  end

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
