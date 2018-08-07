require_relative "../lib/sorting/full_mergesort"

def smallest_difference(ar)
  aux = nil
  ar.sort.each_cons(2){|p| aux = p if aux.nil? || p.reduce(:-).abs < aux.reduce(:-).abs}
  aux
end