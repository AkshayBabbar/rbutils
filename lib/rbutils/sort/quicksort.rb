#Quick Sort implementation in Ruby
public
def quicksort(array) 
  if array.length <= 1
    return array
  else
    pivot = array.sample
    array.delete_at(array.index(pivot)) 
    less = []
    more = []
    array.each do |x|
      if x <= pivot
        less << x
      else
        more << x
      end
    end
    
    sorted = []
    sorted << self.quicksort(less)
    sorted << pivot
    sorted << self.quicksort(more)
    
    sorted.flatten! #make into one array
    return sorted
  end
end

puts quicksort([2, 5, 3, 4, 5])
#output: 2 3 4 5 5 