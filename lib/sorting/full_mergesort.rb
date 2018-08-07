def full_mergesort(ar, criterion = 0)
  #Find the middle point to divide the array into two halves:
  len = ar.length
  len % 2 == 0 ? mid = (len - 1)/2 : mid = len/2
  if len > 1
    #Call mergeSort for first half:
    left = full_mergesort(ar[0..mid], criterion)
    #Call mergeSort for second half:
    right = full_mergesort(ar[mid + 1..len - 1], criterion)
    #Merge the two halves sorted in step 2 and 3:
    merge(left,right, criterion)
  else
    [ar.first]
  end
end

private

def merge(first,second,criterion = 0)
  aux = first.dup
  second.each do |s|
    idx = aux.length
    idx -= 1 while idx > 0 && s[criterion] < aux[idx - 1][criterion]
    aux.insert(idx,s)
  end
  aux
end