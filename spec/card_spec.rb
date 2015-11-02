require "spec_helper"
require "card"

describe Card do
  describe "#initialize" do
    it "builds a card from a string" do
      valid_cards = %w(2S 2D AH 3S 5S 2H 2C KH 5H 9C)
      valid_cards.each do |card|
        expect(described_class.new(card)).to be_a(described_class)
      end
    end

    context "with wrong card identifying string" do
      it "will fail with an invalid rank (number or face)" do
        cards_with_invalid_rank = %w(HH ID PH PC RD DD)
        cards_with_invalid_rank.each do |card|
          expect {
            described_class.new(card)
          }.to raise_error(ArgumentError)
        end
      end

      it "will fail with an invalid suit" do
        cards_with_invalid_suit = %w(HF IV PA PF RL DY)
        cards_with_invalid_suit.each do |card|
          expect {
            described_class.new(card)
          }.to raise_error(ArgumentError)
        end
      end
    end
  end

  describe "#<=>" do
    it "will return -1 if the receiver card is less than the other card" do
      card_pairs = [
        %w(7D AD),
        %w(JD AD),
        %w(KD AS),
        %w(TD QC)
      ]

      card_pairs.each do |card, greater_card|
        card = Card.new(card)
        greater_card = Card.new(greater_card)

        expect(card <=> greater_card).to eq(-1)
      end
    end

    it "will return 1 if the receiver card is greater than the other card" do
      card_pairs = [
        %w(7D 6D),
        %w(JS 6D),
        %w(KC JD),
        %w(TD 2D)
      ]

      card_pairs.each do |card, lesser_card|
        card = Card.new(card)
        lesser_card = Card.new(lesser_card)

        expect(card <=> lesser_card).to eq(1)
      end
    end

    it "will return 0 if both cards have the same rank" do
      card_pairs = [
        %w(7D 7D),
        %w(JS JD),
        %w(KC KD),
        %w(TD TD)
      ]

      card_pairs.each do |card, equal_card|
        card = Card.new(card)
        equal_card = Card.new(equal_card)

        expect(card <=> equal_card).to eq(0)
      end
    end
  end

  describe "#next" do
    it "will return the next card sorted by rank" do
      card_sequences = [
        %w(2S 3S),
        %w(KH AH),
        %w(TH JH),
        %w(9H TH)
      ]

      card_sequences.each do |card, next_card|
        expect(Card.new(card).next).to eq(Card.new(next_card))
      end
    end
  end

  describe "#prev" do

  end
end
