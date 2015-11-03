require "spec_helper"
require "poker_hands"

describe FullHouse do
  describe "#<=>" do
    it "returns -1 if the receiver is smaller" do
      receiver = described_class.new(%w(KH KH TH TH TH))
      other    = described_class.new(%w(KH KH KH TH TH))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (with tie)" do
      receiver = described_class.new(%w(KH KH KH 4C 4S))
      other    = described_class.new(%w(KH KH KH TH TH))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns 1 if there receiver is greater" do
      receiver = described_class.new(%w(TH 3H 3H TH TH))
      other    = described_class.new(%w(7H 7H 7H 9H 9H))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 1 if there receiver is greater (with tie)" do
      receiver = described_class.new(%w(TH TH TH 9H 9H))
      other    = described_class.new(%w(TH TH TH 3H 3C))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 0 if there's a draw" do
      receiver = described_class.new(%w(TH TH TH KH KS))
      other    = described_class.new(%w(TH TH TH KH KC))

      expect(receiver<=>(other)).to eq(0)
    end
  end

  describe "#cards_match?" do
    it "is true if the given hand has full house" do
      poker_hands = [
        %w(5H 5H 5H 3H 3H),
        %w(6D 5S 5H 6H 6C),
        %w(AD AS JH JH AC),
        %w(2S 2S AS AS 2S)
      ]

      poker_hands.each do |poker_hand|
        poker_hand = described_class.new(poker_hand)

        expect(poker_hand.cards_match?).to be_truthy
      end
    end

    it "is false if the given hand doesn't have full house" do
      poker_hands = [
        %w(5H 5H 7H 7H 9D),
        %w(5H 5H 5H 7H 9D),
        %w(5H 6H 7H 7H 7D),
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
