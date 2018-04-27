def countDepth(array)
    count = array.length
    depth = 0
    while count > 0
      count /= 2
      depth += 1
    end
    depth
end

print countDepth([1,7,5,2,6,0,9,3,7,5,11,0,0,4,0])



