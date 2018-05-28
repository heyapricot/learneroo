def recursive_hanoi(num)

  output = hanoi(num, 1,3,2)

end

def hanoi(n, source = nil, target = nil, aux = nil, output = [])
  if n == 1
    output.push([source,target])
  else
    hanoi(n - 1, source, aux, target, output)
    output.push([source,target])
    hanoi(n - 1, aux, target, source, output)
    output
  end
end