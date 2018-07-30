def mergesort(ar)
  #Find the middle point to divide the array into two halves:
  len = ar.length
  len % 2 == 0 ? mid = (len - 1)/2 : mid = len/2
  if len > 1
    #Call mergeSort for first half:
    left = mergesort(ar[0..mid])
    #Call mergeSort for second half:
    right = mergesort(ar[mid + 1..len - 1])
    #Merge the two halves sorted in step 2 and 3:
    merge(left,right)
  else
    [ar.first]
  end
end

private

def merge(first,second)
  aux = first.dup
  second.each do |s|
    len = aux.length
    idx = 0
    while idx < len && s > aux[idx]
      idx += 1
    end
    aux.insert(idx, s)
  end
  aux
end

mergesort([-3, 2, 2, 2, 4, -2, 0, 1, 5, 7])