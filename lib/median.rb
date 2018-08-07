require_relative "sorting/lomuto_quicksort"

def quickselect(ar, left = 0, right = ar.length - 1, k = ar.length / 2)
  return ar[left] if left == right
  pi = ((left..k - 1).to_a + ((k + 1)..right).to_a).sample
  pi = select(ar,left, right, pi)

  case
  when k == pi
    return ar[k]
  when k < pi
    return quickselect(ar, left, pi - 1, k)
  when k > pi
    return quickselect(ar, pi + 1, right, k)
  end
end

def select(array, low = 0, high = array.length - 1, pivotIndex = high)
  pivot = array[pivotIndex]
  array[pivotIndex], array[high] = array[high], array[pivotIndex]
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

quickselect([0, 1, 2, 4, 6, 5, 3, 8, 9])