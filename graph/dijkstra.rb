require_relative "priorityqueue"

class Dijkstra
  
  #source node and graph needed
  def initialize(graph, source)
  
    #init variables
    @graph = graph
    @source = source
    @path = {}
    @dist_to = {}
    @queue = PriorityQueue.new

    #compute the shortest path
    computeSP
  end

  def path_to(node)
    path = []
    while node != @source
      #add node to the front of the path
      path.unshift(node)
      node = @path[node]
    end
    #add the source at the beginning
    #invariant: source is at the front
    # and remaining nodes in the path are behind it
    # (reverse order)
    path.unshift(@source)
  end

  #Computer the shortest path source the source and 
  #Every other node
  def computeSP
    @graph.nodes.each do |node|
      @dist_to[node]=Float::INFINITY
    end
    @dist_to[@source] = 0
    
    #node and it's distance to source (source -> source = 0)
    @queue.insert(@source, 0)
    
    #while elements exist in the queue
    while @queue.any?
      #check the lowest distance (closest)
      close = @queue.remove_min
      #check each adjacent edge
      close.adjacent_edges.each do |adjacent|
        relax(adjacent)
      end
    end
  end

  # Check if the shortest known path is still the shortest path 
  # That is, are there any shorter paths along this edge? 
  def relax(edge)
    #If the distance currently is lower than the added distance,
    #Don't increase it.
    return if @dist_to[edge.dest] <= @dist_to[edge.source] + edge.weight
    
    #Update the distance and add it back to the queue
    @dist_to[edge.dest] = @dist_to[edge.source] + edge.weight
    @path[edge.dest] = edge.source
    @queue.insert(edge.dest, @dist_to[edge.dest])
  end
end