class Node
  attr_accessor :left, :right, :data, :connections
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
  node.connections = [node.left, node.right]
  return node
end

def bfs(start = 0, queue = [], search = 0)
  node = Node.head
  unless node.nil?
    node.balance = false if node.data == 0
    node.connections.each {|conn| queue.push(conn)}
  end
  bfs(queue.shift(),queue) unless queue.empty?
end


ar = [20,10,27,5,14,23,30,0,12,0,0,0,0,0,0] #false
arr = [20,10,27,5,14,23,30] #true
arrr = [21,11,26,5,14,23,30,2,8,13,16,0,0,0,0] #true
a = [19,9,26,4,13,17,29] #false

arrayToTree(a)
bfs(Node.head)
Node.clear
