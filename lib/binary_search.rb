def binary_search(ar,low = 0, high = ar.length - 1)
  #Get the mid
  (high - low) % 2 == 0 ? mid = (high + low)/2 : mid = (high + low - 1)/2

  if ar[mid] == mid
    return mid
  elsif high - low <= 1
    return -1
  end
  ar[mid] if ar[mid] == mid
  high = mid if ar[mid] > mid
  low = mid if ar[mid] < mid
  binary_search(ar,low, high)
end

binary_search([-20, -15, -11, 2, 5, 7, 10, 11, 12, 13, 14, 14])
