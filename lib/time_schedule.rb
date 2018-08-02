require_relative "../lib/sorting/full_mergesort"

def time_schedule(ar)
  #Build the pairs
  input = ar.each_slice(2).to_a
  #Sort each element by the first item
  input = full_mergesort(input)
  #From right to left check if the start time is lower than the end time. If it is, there's an overlap (Pop element)

  idx = input.length - 1
  while idx >= 1
    while idx >= 1 && input[idx - 1][1] > input[idx][0]
      input.delete(input[idx - 1])
      idx -= 1
    end
    idx -= 1
  end

  input
end