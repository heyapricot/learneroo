def recursive_combination(ar,output = [[]])

  exit = combine(ar.shift,output)

  if ar.empty?
    return exit
  else
    recursive_combination(ar,exit)
  end

end

def combine(num,options)

  len = options.length

  len.times do |i|
    aux = options[i].dup
    options.unshift(options.shift)

    aux.push(num)
    options.push(aux)
  end

  return options
end

print recursive_combination([1,2,3])

#[[],[1],[],{3}]

#[[],[1],[3],[1,3]]
# [[],[1],[3],[5],[1,3],[1,5],[3,5],[1,3,5]]