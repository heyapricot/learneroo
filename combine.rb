def combine(num,options = [[]])
  return options + options.map {|elem| elem + [num]}
end


print combine(1)
puts
print combine(3,[[],[1]])