class BFS < Graph
  def initialize(graph, source)
    @graph = graph
    @node = source
    @visited = []
    @edge_to = {}

    bfs(source)
  end

  def bfs(node)
    #we have to use a queue for BFS
    queue = []
    #initially push the node to the queue
    queue << node
    #mark node as visited
    @visited << node
    
    #while there are elements in the wueue,
    #continue adding from adjacent nodes
    while queue.any?
      curr = queue.shift 
      curr.adjacents.each do |adj|
        next if @visited.include?(adj)
        queue << adj
        @visited << adj
        @edge_to[adj] = curr
      end
    end
  end
  
  #returns the path to the node after
  #bfs has completed
  def path_to(node)
    return unless @visited.include?(node)
    path = []
    while(node != @node) do
      path.unshift(node) 
      node = @edge_to[node]
    end
    path.unshift(@node)
  end
end