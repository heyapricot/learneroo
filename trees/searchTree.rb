class Node
  attr_accessor :left, :right, :data
  @@head = nil
  def initialize(data)
    @data = data
    @@head = self unless @@head.nil? == false
  end

  def self.head
    @@head
  end

end

def arrayToTree(array, i = 0)
  if i >= array.length || array[i] == 0
    return
  end

  node = Node.new(array[i])
  node.left = arrayToTree(array, 2*i+1)
  node.right = arrayToTree(array, 2*i+2)
  return node
end

def isSearchTree?(node, result = true, heads = [])

  heads.push(node.data)

  unless node.left.nil?
    heads.each {|dat| return false if node.left.data > dat }
    result = isSearchTree?(node.left, result, heads)
  end

  unless node.right.nil?
    heads.each {|dat| return false if node.right.data < dat}
    result = isSearchTree?(node.right, result, heads)
  end

  result
end

ar = [20,10,27,5,14,23,30,0,12,0,0,0,0,0,0]
arr = [20,10,27,5,14,23,30]
arrr = [21,11,26,5,14,23,30,2,8,13,16,0,0,0,0]

arrayToTree(arrr)
puts isSearchTree?(Node.head)




