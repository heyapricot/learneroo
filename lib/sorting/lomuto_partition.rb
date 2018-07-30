$count = 0

def lomuto_partition(array, low, high, count = 0)
  pivot = array[high]
  i = low - 1
  (low..high - 1).each do |idx|
    if array[idx] <= pivot
      i += 1
      array[i], array[idx] = array[idx], array[i]
      $count += 1
    end
  end
  array[i+1], array[high] = array[high], array[i+1]
  $count += 1
  return i + 1
end

def in_place_quicksort(array, low, high)
  if low < high
    partitioning_index = lomuto_partition(array, low, high)
    in_place_quicksort(array, low, partitioning_index - 1)
    in_place_quicksort(array, partitioning_index + 1, high)
  end
end

ar = [9,8,6,7,3,5,4,1,2]

in_place_quicksort(ar,0,ar.length - 1)
print "Count has: #{$count}\n"