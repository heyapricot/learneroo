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

def treeBFS(queue)

  unless queue.empty?
    node = queue.shift
    print "#{node.data} "
    queue.push(node.left) unless node.left.nil?
    queue.push(node.right) unless node.right.nil?
    treeBFS(queue)
  end

end

ar = [20,10,27,5,14,23,30]
arrayToTree(ar)
q = [Node.head]
treeBFS(q)
