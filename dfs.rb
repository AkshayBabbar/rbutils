class DFS
  def initialize(graph, source)
    @graph = graph
    @source = source
    
    @visited = Array.new
    @edge_to = Set.new
    
    #perform depth first search on this node
    dfs(source)
  end

  def dfs(node)
    @visited << node
    node.adjacents.each do |adjacent|
      next if @visited.include?(adjacent)
      dfs(adjacent)
      @edge_to[adjacent] = node
    end
  end

  def path_to(node)
    return unless @visited.include?(node)
    path = []
    curr = node

    while(curr != @source) do
      path.unshift(curr)
      curr = @edge_to[curr]
    end
    path.unshift(@source)
  end
end