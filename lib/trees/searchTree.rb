class Node
  attr_accessor :left, :right, :data
  @@head = nil
  def initialize(data)
    @data = data
    @@head = self unless !@@head.nil?
  end

  def self.head
    @@head
  end

  def self.clear
    @@head = nil
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

def search?(node,parent = nil,isLeft = nil)

  output = true

  if !isLeft.nil? && isLeft
    return false if !parent.nil? && node.data > parent
    return false if !node.left.nil? && node.left.data > parent
    return false if !node.right.nil? && node.right.data > parent

  elsif !isLeft.nil? && !isLeft
    #isRight
    return false if !parent.nil? && node.data < parent
    return false if !node.left.nil? && node.left.data < parent
    return false if !node.right.nil? && node.right.data < parent

  end

  output = search?(node.left,node.data, true) unless node.left.nil? || !output
  output = search?(node.right,node.data, false) unless node.right.nil? || !output

  output

end

ar = [20,10,27,5,14,23,30,0,12,0,0,0,0,0,0] #false
arr = [20,10,27,5,14,23,30] #true
arrr = [21,11,26,5,14,23,30,2,8,13,16,0,0,0,0] #true
a = [19,9,26,4,13,17,29] #false

arrayToTree(a)
puts search?(Node.head)




