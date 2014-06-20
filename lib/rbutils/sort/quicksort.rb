#Quick Sort implementation in Ruby
public
def quicksort(array, l, r)
  if r == -1
    r = array.length - 1
  end

  if l == -1
    l = 0
  end

  if (r - l) < 1
    return array
  else
    pivot = array[l]
    i = l+1
    for j in l+1..r
        if array[j] < pivot
            array[j], array[i] = array[i], array[j]
            i += 1
	end
    end
    
    array[l], array[i-1] = array[i-1], array[l]
    array = quicksort(array, l, i-1)
    array = quicksort(array, i, r)
    return array
  end

end