class Edge
  attr_accessor :from, :to, :weight

  def initialize(from, to, weight)
    @from, @to, @weight = from, to, weight
  end

  def <=>(other)
    self.weight <=> other.weight
  end

  def to_str
    "#{from.to_s} => #{to.to_s}, weight is #{weight}"
  end
end