require_relative 'graph'
require_relative 'node'
require_relative 'edge'

g = Graph.new

#test the order
puts g.nodes.empty? 
n = Node.new("a")
g.add_node(n)
puts g.degree(n)
x = Node.new("b")
g.add_node(x)
g.connect(x, n)
puts g.degree(x)
puts g.degree(n)