require "pp"
require_relative "graph"
require_relative "node"
require_relative "edge"
require_relative "dijkstra"

g = Graph.new

g.add_node(n0 = Node.new("A"))
g.add_node(n1 = Node.new("B"))
g.add_node(n2 = Node.new("C"))
g.add_node(n3 = Node.new("D"))
g.add_node(n4 = Node.new("E"))
g.add_node(n5 = Node.new("F"))
g.add_node(n6 = Node.new("G"))
g.add_node(n7 = Node.new("H"))

#Path should be 
g.add_edge(n0, n1, 5)
g.add_edge(n0, n4, 2)
g.add_edge(n0, n7, 8)
g.add_edge(n4, n7, 5)
g.add_edge(n6, n2, 4)
g.add_edge(n5, n6, 15)
g.add_edge(n7, n5, 4)
g.add_edge(n3, n6, 2)
g.add_edge(n4, n5, 40)
g.add_edge(n4, n6, 1)
g.add_edge(n7, n2, 7)

sp = Dijkstra.new(g, n4).path_to(n2)
pp sp.map(&:to_str)