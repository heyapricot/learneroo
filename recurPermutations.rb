def recurPermutations(ar,output = [[]])

  ar.each_index do |n|

    if n == ar.length - 1
      #end of array
      print combine(ar[n],output)
    else
      ar.shift
      recurPermutations(ar,combine(ar[n],output))
    end

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

recurPermutations([1,3,5,7,9])

#[[],[1],[],{3}]

#[[],[1],[3],[1,3]]
# [[],[1],[3],[5],[1,3],[1,5],[3,5],[1,3,5]]