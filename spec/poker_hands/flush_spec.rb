require "spec_helper"
require "poker_hands"

describe Flush do
  describe "#<=>" do
    it "returns -1 if the receiver is smaller" do
      receiver = described_class.new(%w(5H 2H 7H 8H 4H))
      other    = described_class.new(%w(5H 2H 7H 8H 9H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (one tie)" do
      receiver = described_class.new(%w(5H 6H 7S KH 4H))
      other    = described_class.new(%w(5H 6D 7H KD 9H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (two ties)" do
      receiver = described_class.new(%w(5H 2S JH KS 4H))
      other    = described_class.new(%w(5H 2H JD KD 9H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (three ties)" do
      receiver = described_class.new(%w(AH QH TH 2S 5H))
      other    = described_class.new(%w(AH QD TH 8D 2H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (four ties)" do
      receiver = described_class.new(%w(KH 6H 7C 8H 3C))
      other    = described_class.new(%w(KH 6D 7H 8H 4S))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns 1 if there receiver is greater" do
      receiver = described_class.new(%w(AH 6H 7H 8H 9H))
      other    = described_class.new(%w(5H 6H 7H 8H 9H))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 0 if there's a draw" do
      receiver = described_class.new(%w(KH 6D 7S 8H 4S))
      other    = described_class.new(%w(KD 6S 7H 8H 4S))

      expect(receiver<=>(other)).to eq(0)
    end
  end

  describe "#cards_match?" do
    it "is true if the given hand has flush" do
      poker_hands = [
        %w(5H 5H 5H 3H 3H),
        %w(6S 5S 5S 6S 6S),
        %w(AH AH JH JH AH),
        %w(2S 2S AS AS 2S)
      ]

      poker_hands.each do |poker_hand|
        poker_hand = described_class.new(poker_hand)

        expect(poker_hand.cards_match?).to be_truthy
      end
    end

    it "is false if the given hand doesn't have flush" do
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
