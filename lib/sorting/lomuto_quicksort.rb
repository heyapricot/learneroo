def lomuto_partition(array, low = 0, high = array.length - 1)
  pivot = array[high]
  i = low
  (low..high - 1).each do |idx|
    if array[idx] < pivot
      array[i], array[idx] = array[idx], array[i]
      i += 1
    end
  end
  array[i], array[high] = array[high], array[i]
  return i
end

def lomuto_quicksort(array, low = 0, high = array.length - 1)
  if low < high
    partitioning_index = lomuto_partition(array, low, high)
    lomuto_quicksort(array, low, partitioning_index - 1)
    lomuto_quicksort(array, partitioning_index + 1, high)
  end
  array
end
