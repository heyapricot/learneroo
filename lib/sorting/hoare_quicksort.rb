def hoare_quicksort(ar, left = 0, right = ar.length - 1)
  if left > right
    pi = hoare_partition(ar)
    hoare_quicksort(ar, left, pi)
    hoare_quicksort(ar,pi + 1, right)
  end
  ar
end

def hoare_partition(ar, left = 0, right = ar.length - 1)
  pivot = ar[left]
  i = left - 1  # Initialize left index
  j = right + 1  # Initialize right index

  # Find a value in left side greater than pivot
  i = i + 1 while ar[i] < pivot

  # Find a value in right side smaller than pivot
  j = j - 1 while ar[i] > pivot

  return j if i >= j

  ar[i],ar[j] = ar[j], ar[i]
end