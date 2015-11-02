require "spec_helper"
require "card_suit"

describe CardSuit do
  describe "#initialize" do
    it "builds a suit from a string" do
      valid_suits = %w(H D C S)
      valid_suits.each do |suit|
        expect(described_class.new(suit)).to be_a(described_class)
      end
    end

    it "will fail with an invalid suit" do
      invalid_suits = %w(1 3D SS HH DC s v k)
      invalid_suits.each do |suit|
        expect {
          described_class.new(suit)
        }.to raise_error(ArgumentError)
      end
    end
  end
end
