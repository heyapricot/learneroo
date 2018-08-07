def duplicates(first, second)
  occ = Hash.new(0)
  second.each{|n| occ[n] += 1 }
  first.each{|n| occ[n] -= 1}
  occ.select{|k,v| k if v > 0}.keys.sort
end