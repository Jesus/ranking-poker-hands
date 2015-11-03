class CardRank
  RANKS = %w(2 3 4 5 6 7 8 9 T J Q K A)

  def self.all_ranks
    RANKS.map { |rank| new(rank) }
  end

  include Comparable

  attr_reader :rank

  def initialize(rank)
    @rank = rank

    validate!
  end

  def <=>(other)
    self.rank_index <=> other.rank_index
  end

  def next
    if @rank == RANKS.last
      nil
    else
      self.class.new(RANKS[self.rank_index + 1])
    end
  end

  def prev
    if @rank == RANKS.first
      nil
    else
      self.class.new(RANKS[self.rank_index - 1])
    end
  end

protected

  def rank_index
    RANKS.index @rank
  end

  def validate!
    raise ArgumentError, "Rank '#{@rank}' is invalid" unless rank_is_valid?
  end

  def rank_is_valid?
    RANKS.include? @rank
  end
end
