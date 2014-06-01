class Edge
  attr_accessor :source
  attr_accessor :dest
  attr_accessor :weight

  def initialize(source, dest, weight)
    @source = source
    @dest = dest
    @weight = weight
  end

  def <=>(other)
    self.weight <=> other.weight
  end

  def to_str
    "#{source.to_str} => #{dest.to_str}, weight is #{weight}"
  end
end
