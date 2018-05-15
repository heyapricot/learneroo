def exact_change(ar,target,output = [[]])

  output.each {|comb| return true unless comb.reduce(:+) != target }

  ar.empty? ? false : exact_change(ar,target,combine(ar.shift,output))

end

def combine(num,options = [[]])
  return options + options.map {|elem| elem + [num]}
end

puts exact_change((1..5).to_a,12)
puts exact_change([1,3,5,37,18,5],50)
puts exact_change([3,16,11,5,11,5],42)