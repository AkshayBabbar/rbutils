require_relative 'graph'
require_relative 'node'
require_relative 'edge'
require_relative 'dfs'

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

dfs = DFS.new(g,n)
t = dfs.path_to(n)

t.each do |w|
 puts w.to_str
end
