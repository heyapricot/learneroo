def quicksort(ar)
  left = ar.select{|n| n if n < ar[0]}
  left = quicksort(left) if left.length >= 2
  print "#{left.join(" ")}\n" unless left.length < 2
  right = ar.select{|n| n if n > ar[0]}
  right = quicksort(right) if right.length >= 2
  print "#{right.join(" ")}\n" unless right.length < 2
  left | [ar[0]] | right
end


print "#{quicksort(ar).join(" ")}\n"