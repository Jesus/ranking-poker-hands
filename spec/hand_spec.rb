require "spec_helper"
require "hand"

describe Hand do
  describe "#initialize" do
    it "builds a hand from an array of " do
      expect(described_class.new(%w(AS AD 5S 6D 7H))).to be_a(described_class)
    end

    context "with wrong amount of cards" do
      it "will fail with 4 cards" do
        expect {
          described_class.new(%w(AS AD 5S 6D))
        }.to raise_error(ArgumentError)
      end

      it "will fail with 8 cards" do
        expect {
          described_class.new(%w(AS AD 5S 6D AS AD 5S 6D))
        }.to raise_error(ArgumentError)
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
end
