require "spec_helper"
require "poker_hand"

describe PokerHand do
  describe "#min_rank" do
    it "determines the smallest rank of the 5 cards" do
      hand = described_class.new(%w(AS AD 5S 6D 7H))

      expect(hand.min_rank).to eq(CardRank.new('5'))
    end
  end

  describe "#max_rank" do
    it "determines the smallest rank of the 5 cards" do
      hand = described_class.new(%w(AS AD 5S 6D 7H))

      expect(hand.max_rank).to eq(CardRank.new('A'))
    end
  end

  describe "#is_straight?" do
    it "is true if all cards have the same suit" do
      straight_hands = [
        %w(AS AS 5S 6S 7S),
        %w(AH AH 5H 6H 7H),
        %w(AD AD 5D 6D 7D)
      ]

      straight_hands.each do |hand|
        hand = described_class.new(hand)

        expect(hand.is_straight?).to be(true)
      end
    end

    it "is false if any card has a different suit" do
      non_straight_hands = [
        %w(AH AS 5S 6S 7S),
        %w(AH AH 5S 6H 7H),
        %w(AD AC 5D 6D 7D)
      ]

      non_straight_hands.each do |hand|
        hand = described_class.new(hand)

        expect(hand.is_straight?).to be(false)
      end
    end
  end

  describe "#is_flush?" do
    it "is true if all card ranks are successive" do
      flush_hands = [
        %w(AS JS QS KS TS),
        %w(9S JH QS KS TS),
        %w(8H 4H 5H 6H 7H),
        %w(2D 3D 4D 5D 6D)
      ]

      flush_hands.each do |hand|
        hand = described_class.new(hand)

        expect(hand.is_flush?).to be(true)
      end
    end

    it "is false unless all card ranks are successive" do
      non_flush_hands = [
        %w(AH AS 5S 6S 7S),
        %w(AH AH 5S 6H 7H),
        %w(AD AC 5D 6D 7D)
      ]

      non_flush_hands.each do |hand|
        hand = described_class.new(hand)

        expect(hand.is_flush?).to be(false)
      end
    end
  end
end
