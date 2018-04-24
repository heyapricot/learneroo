class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
  end
end

def array2tree(array, i = 0)
  if i >= array.length || array[i] ==  0
    return
  end

  node = Node.new(array[i])
  node.left = array2tree(array, 2*i+1)
  node.right = array2tree(array, 2*i+2)
  return node
end

def depthfirstsearch(node, count = 0)
  #count depth per branch

  unless node.left.nil?
    count += 1
    depthfirstsearch(node.left, count)
  end

  unless node.right.nil?
    count += 1
    depthfirstsearch(node.right, count)
  end

  $depth = count if count > $depth
end

$depth = 0

depthfirstsearch(array2tree([5,3,2,9,0,0,7,0,0,0,0,0,0,5,0]))
puts $depth
