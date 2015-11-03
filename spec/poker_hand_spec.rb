require "spec_helper"
require "poker_hand"
require 'poker_hands/straight_flush'
require 'poker_hands/four_of_a_kind'
require 'poker_hands/full_house'
require 'poker_hands/flush'
require 'poker_hands/straight'
require 'poker_hands/three_of_a_kind'
require 'poker_hands/two_pair'
require 'poker_hands/one_pair'
require 'poker_hands/high_card'

describe PokerHand do
  describe "::new" do
    it "returns an object representing the highest possible poker hand" do
      hands = [
        [%w(2S 2D 5S 5D 4H), TwoPair],
        [%w(2H 3H 5H 4H 6H), StraightFlush],
        [%w(2S 3D AS 5D 4H), HighCard],
        [%w(2S 2D 5S 5D 5H), FullHouse],
        [%w(2S 2D 2C 5D 4H), ThreeOfAKind],
        [%w(2H 3H AH 5H 4H), Flush],
        [%w(4D 4S 3H 3C 3S), FullHouse]
      ]

      hands.each do |hand, hand_type|
        expect(described_class.new(hand)).to be_a(hand_type)
      end
    end
  end

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

  describe "#is_flush?" do
    it "is true if all cards have the same suit" do
      hands = [
        %w(AS AS 5S 6S 7S),
        %w(AH AH 5H 6H 7H),
        %w(AD AD 5D 6D 7D)
      ]

      hands.each do |hand|
        hand = described_class.new(hand)

        expect(hand.is_flush?).to be(true)
      end
    end

    it "is false if any card has a different suit" do
      hands = [
        %w(AH AS 5S 6S 7S),
        %w(AH AH 5S 6H 7H),
        %w(AD AC 5D 6D 7D)
      ]

      hands.each do |hand|
        hand = described_class.new(hand)

        expect(hand.is_flush?).to be(false)
      end
    end
  end

  describe "#is_straight?" do
    it "is true if all card ranks are successive" do
      hands = [
        %w(AS JS QS KS TS),
        %w(9S JH QS KS TS),
        %w(8H 4H 5H 6H 7H),
        %w(2D 3D 4D 5D 6D)
      ]

      hands.each do |hand|
        hand = described_class.new(hand)

        expect(hand.is_straight?).to be(true)
      end
    end

    it "is false unless all card ranks are successive" do
      hands = [
        %w(AH AS 5S 6S 7S),
        %w(AH AH 5S 6H 7H),
        %w(AD AC 5D 6D 7D)
      ]

      hands.each do |hand|
        hand = described_class.new(hand)

        expect(hand.is_straight?).to be(false)
      end
    end
  end

  describe "#rank_count" do
    it "counts the amount of cards with the given rank" do
      hands = [
        [%w(AS JS QS KS TS), 'A', 1],
        [%w(9S JH QS KS TS), 'T', 1],
        [%w(8H 4H 5H 6H 7H), '3', 0],
        [%w(2D 3D 4D 5D 6D), '9', 0],
        [%w(4D 4D 4D 4D 4D), '4', 5]
      ]

      hands.each do |hand, rank, count|
        hand = described_class.new(hand)
        rank = CardRank.new(rank)

        expect(hand.rank_count(rank)).to eq(count)
      end
    end
  end

  describe "#suit_count" do
    it "counts the amount of cards with the given suit" do
      hands = [
        [%w(AS JS QS KS TS), 'S', 5],
        [%w(9S JH QS KS TS), 'S', 4],
        [%w(8H 4H 5H 6H 7H), 'S', 0],
        [%w(2D 3D 4D 5D 6D), 'D', 5]
      ]

      hands.each do |hand, suit, count|
        hand = described_class.new(hand)
        suit = CardSuit.new(suit)

        expect(hand.suit_count(suit)).to eq(count)
      end
    end
  end
end
