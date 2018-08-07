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
    idx = aux.length
    idx -= 1 while idx > 0 && s < aux[idx - 1]
    aux.insert(idx,s)
  end
  aux
end