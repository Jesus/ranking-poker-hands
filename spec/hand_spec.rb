require "spec_helper"
require "hand"

describe Hand do
  describe "#initialize" do
    it "builds a `Hand` from an `Array` of `String`s" do
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

  describe "#to_s" do

  end
end
