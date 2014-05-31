class Edge
  attr_accessor :from
  attr_accessor :to
  attr_accessor :weight

  def initialize(from, to, weight)
    @from = from
    @to = to
    @weight = weight
  end

  def <=>(other)
    self.weight <=> other.weight
  end

  def to_str
    "#{from.to_str} => #{to.to_str}, weight is #{weight}"
  end
end
