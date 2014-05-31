require_relative 'graph'
require_relative 'node'
require_relative 'edge'
require_relative 'dfs'
require_relative 'bfs'

g = Graph.new

#test the order
puts g.nodes.empty? 
n = Node.new("a")
g.add_node(n)
puts g.degree(n)
x = Node.new("b")
g.add_node(x)
y = Node.new("c")
g.add_node(y)

puts "\n"       

g.add_edge(x, y)
g.add_edge(y, n)

dfs = DFS.new(g,x)
t = dfs.path_to(n)

bfs = BFS.new(g,x)
t2 = bfs.path_to(n)

puts "BFS: \n"
t.each do |w|
 puts w.to_str
end

puts "DFS: \n"
t2.each do |w|
 puts w.to_str
end