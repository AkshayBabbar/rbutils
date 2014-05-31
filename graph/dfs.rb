class DFS
  def initialize(graph, source)
    @graph = graph
    @source = source
    @visited = []
    @edge_to = {}

    #perform dfs
    dfs(source)
  end

  def dfs(node)
    #mark node as visited
    @visited << node
    
    #take each adjacent node
    node.adjacents.each do |adj|
      next if @visited.include?(adj)
      #perform dfs
      dfs(adj)
      #check edges
      @edge_to[adj] = node
    end
  end

  def path_to(node)
    return unless @visited.include?(node)
    path = []
    curr = node
    
    #get the paths from the specified node to the 
    #source
    while(curr != @source) do
      path.unshift(curr)
      curr = @edge_to[curr]
    end
    path.unshift(@source)
  end
end