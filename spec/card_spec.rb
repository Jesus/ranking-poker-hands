require "spec_helper"
require "card"

describe Card do
  describe "#initialize" do
    it "builds a `Card` from a `String`" do
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
end
