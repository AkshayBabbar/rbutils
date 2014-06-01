class Node
  attr_accessor :name
  attr_accessor :graph
  attr_accessor :adjacents

  def initialize(name)
    @name = name
    @adjacents = Set.new
  end

  def adjacent_edges
    graph.edges.select{|e| e.source == self}
  end

  def to_str
    @name
  end
end