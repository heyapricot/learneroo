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

def isBalanced?(node)
  countLeft = 0
  countRight = 0

  unless node.left.nil?
    countLeft  += isBalanced?(node.left)
    puts "Node: #{node.data} Count left: #{countLeft} "
  end

  unless node.right.nil?
    countRight += isBalanced?(node.right)
    puts "Node: #{node.data} Count right: #{countRight} "
  end

  countLeft + countRight + 1
end

ar = [20,10,27,5,14,23,30,0,12,0,0,0,0,0,0] #false
arr = [20,10,27,5,14,23,30] #true
arrr = [21,11,26,5,14,23,30,2,8,13,16,0,0,0,0] #true
a = [19,9,26,4,13,17,29] #false
myarr = [1,2,3,4,5,6,7]

arrayToTree(myarr)
isBalanced?(Node.head)