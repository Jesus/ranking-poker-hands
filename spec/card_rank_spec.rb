require "spec_helper"
require "card_rank"

describe CardRank do
  describe "#initialize" do
    it "builds a `CardRank` from a `String`" do
      valid_ranks = %w(2 3 4 5 6 7 8 9 T J Q K A)
      valid_ranks.each do |rank|
        expect(described_class.new(rank)).to be_a(described_class)
      end
    end

    it "will fail with an invalid rank (number or face)" do
      invalid_ranks = %w(1 3D SS H M IT v k)
      invalid_ranks.each do |rank|
        expect {
          described_class.new(rank)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#<=>" do
    it "will return -1 if the receiver is less than the other" do
      rank_pairs = [
        %w(7 A),
        %w(J A),
        %w(K A),
        %w(T Q)
      ]

      rank_pairs.each do |rank, greater_rank|
        rank = CardRank.new(rank)
        greater_rank = CardRank.new(greater_rank)

        expect(rank <=> greater_rank).to eq(-1)
      end
    end

    it "will return 1 if the receiver is greater than the other" do
      rank_pairs = [
        %w(7 6),
        %w(J 6),
        %w(K J),
        %w(T 2)
      ]

      rank_pairs.each do |rank, lesser_rank|
        rank = CardRank.new(rank)
        lesser_rank = CardRank.new(lesser_rank)

        expect(rank <=> lesser_rank).to eq(1)
      end
    end

    it "will return 0 if both ranks are equal" do
      rank_pairs = [
        %w(7 7),
        %w(J J),
        %w(Q Q),
        %w(A A)
      ]

      rank_pairs.each do |rank, equal_rank|
        rank = CardRank.new(rank)
        equal_rank = CardRank.new(equal_rank)

        expect(rank <=> equal_rank).to eq(0)
      end
    end
  end

  describe "#next" do
    it "will return the next rank" do
      rank_sequences = [
        %w(2 3),
        %w(K A),
        %w(T J),
        %w(9 T)
      ]

      rank_sequences.each do |rank, next_rank|
        expect(CardRank.new(rank).next).to eq(CardRank.new(next_rank))
      end
    end

    it "will return nil if the rank is an ace" do
      expect(CardRank.new('A').next).to be_nil
    end
  end

  describe "#prev" do
    it "will return the previous card sorted by rank (max)" do
      rank_sequences = [
        %w(3 2),
        %w(A K),
        %w(J T),
        %w(T 9)
      ]

      rank_sequences.each do |rank, next_rank|
        expect(CardRank.new(rank).prev).to eq(CardRank.new(next_rank))
      end
    end

    it "will return nil if the rank is 2 (min)" do
      expect(CardRank.new('2').prev).to be_nil
    end
  end
end
