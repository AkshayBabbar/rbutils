require 'set'

class Graph
  attr_accessor :nodes
  attr_accessor :edges

  def initialize
    @nodes = Set.new
    @edges = []
    @connections = Hash.new
  end

  def add_node(node)
    nodes << node
    node.graph = self
  end

  #adds an edge to the graph
  def add_edge(from, to, weight)
    edges << Edge.new(from, to, weight)
  end
  
  #connects two nodes in the graph
  def connect node1, node2
    if !Set.new([node1, node2]).subset? @nodes
      raise BadNodeInput, 'The graph does not have either ' + node1 + ' or ' + node2
    end
    @connections[node1] ||= Array.new
    @connections[node1].push node2
    unless node1.eql? node2
      @connections[node2] ||= Array.new
      @connections[node2].push node1
    end
  end
  
  #disconnects two nodes in the graph
  def disconnect node1, node2
    if !nodes.include?(node1) || !nodes.include?(node2)
      raise NodeContainsException, 'The graph does not contain either ' + node1 + ' or ' + node2
    end
    @connections[node1].delete node2
    @connections[node2].delete node1
  end
  
  #returns the degree of the specified node
  def degree node
    d = 0
    if (@connections[node].is_a? (Array)) && nodes.include?(node)
      d = @connections[node].count
      if @connections[node].include?(node)
        d += 1
      end
    end
    return d
  end
  
  def adjacents node
    @connections[node]
  end
end