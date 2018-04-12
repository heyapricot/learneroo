class Node
  attr_accessor :left, :right, :data

  def initialize(data)
    @data = data
  end

end

def arrayToTree(array, i = 0)
  if i >= array.length || array[i] ==  0
    return
  end

  node = Node.new(array[i])
  node.left = arrayToTree(array, 2*i+1)
  node.right = arrayToTree(array, 2*i+2)
  return node
end


def recurPrint(node)
  recurPrint(node.left) unless node.left.nil?
  recurPrint(node.right) unless node.right.nil?
  print "#{node.data} "
end


recurPrint(arrayToTree([10,1, 2, 3, 4, 5, 6]))