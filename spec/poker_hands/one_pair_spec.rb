require "spec_helper"
require "poker_hands"

describe OnePair do
  describe "#<=>" do
    it "returns -1 if the receiver is smaller" do
      receiver = described_class.new(%w(TH TH 6D 3S KH))
      other    = described_class.new(%w(KH KH 2H 3H TH))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (with tie)" do
      receiver = described_class.new(%w(KH KH 9H 9C 4S))
      other    = described_class.new(%w(KH KH TS AH 3H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (with two ties)" do
      receiver = described_class.new(%w(KH KH AH 2C 4S))
      other    = described_class.new(%w(KH KH AH QH 5H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (with three ties)" do
      receiver = described_class.new(%w(KH KH 3H AC TS))
      other    = described_class.new(%w(KH KH 4H AH TH))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns 1 if there receiver is greater" do
      receiver = described_class.new(%w(TH 3H 3H AH 4H))
      other    = described_class.new(%w(7H 3H AH 2S 2H))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 1 if there receiver is greater (with tie)" do
      receiver = described_class.new(%w(TH AH 2H 9H 9H))
      other    = described_class.new(%w(TH QH 9H 9H 3C))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 0 if there's a draw" do
      receiver = described_class.new(%w(TH TD 2H 9H 9H))
      other    = described_class.new(%w(TH TD 2H 9H 9H))

      expect(receiver<=>(other)).to eq(0)
    end
  end

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
