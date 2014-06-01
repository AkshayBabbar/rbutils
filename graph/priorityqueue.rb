class PriorityQueue
  def initialize
    @queue = {}
  end

  def any?
    return @queue.any?
  end

  def insert(key, value)
    @queue[key] = value
    @queue.sort_by {|_key, value| value }
  end
    
  def remove_max
    @queue.shift.last
  end
  
  def remove_min
    @queue.shift.first
  end
end