require "spec_helper"
require "poker_hands"

describe HighCard do
  describe "#<=>" do
    it "returns -1 if the receiver is smaller" do
      receiver = described_class.new(%w(KH JH TD 6S 3H))
      other    = described_class.new(%w(KH AH 2H 3H TH))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (with tie)" do
      receiver = described_class.new(%w(AH JH TD 6S 3H))
      other    = described_class.new(%w(AH 2H TS KH 3H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (with two ties)" do
      receiver = described_class.new(%w(KH AH 3H 2C 4S))
      other    = described_class.new(%w(KH AH 3H QH 5H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (with three ties)" do
      receiver = described_class.new(%w(KH TH 3H AC 2S))
      other    = described_class.new(%w(KH TH 4H AH 6H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns -1 if the receiver is smaller (with four ties)" do
      receiver = described_class.new(%w(KH 9H TH 2C 4S))
      other    = described_class.new(%w(KH 9H TH 3H 4H))

      expect(receiver<=>(other)).to eq(-1)
    end

    it "returns 1 if there receiver is greater" do
      receiver = described_class.new(%w(TH AH 3H 2H 4H))
      other    = described_class.new(%w(7H 3H 4H 2S TH))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 1 if there receiver is greater (with tie)" do
      receiver = described_class.new(%w(TH AH KH 3H 9H))
      other    = described_class.new(%w(TH QH AH 9H 3C))

      expect(receiver<=>(other)).to eq(1)
    end

    it "returns 0 if there's a draw" do
      receiver = described_class.new(%w(TH TD 2D 9H 9H))
      other    = described_class.new(%w(TH TD 2H 9S 9H))

      expect(receiver<=>(other)).to eq(0)
    end
  end
end
