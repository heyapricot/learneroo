require_relative "../lib/sorting/full_mergesort"
def maximum_time_range(ar)
  #Build the pairs
  input = ar.each_slice(2).to_a
  #Sort each element by the first item
  input = full_mergesort(input,1)

  #Iterate trough every element of the sorted array
  result = []
  idx = input.length - 1
  while idx >= 0
    aux = input[idx].dup
    #Check for overlap
    while idx > 0 && input[idx - 1][1] > aux[0]
      aux[0] = input[idx - 1][0] if aux[0] > input[idx - 1][0]
      idx -= 1
    end
    result.unshift(aux)
    idx -= 1
  end
  result
end