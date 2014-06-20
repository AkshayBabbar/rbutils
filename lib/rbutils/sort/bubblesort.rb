#Bubble sort implementation in Ruby
public
def bubblesort(array)
  x = array.clone
  x.each_index do |i|
    (x.length-i-1).times do |j|
      if (x[j+1] < x[j])
        x[j], x[j+1] = x[j+1], x[j]
      end
    end
  end
  return x
end
