# small trees find depth of all .left.nil? or .right.nil? and place the depths in an array to compare max - min > 2

# large trees find first end of branch and search down to see if branch is longer than two

class Node
  attr_accessor :left, :right, :data, :height
  def initialize(data)
    @data = data
  end
end

def arrayToTree(array, i = 0, height = 0)
  if i >= array.length || array[i] == 0
    return
  end

  node = Node.new(array[i])
  node.height = height
  height += 1
  node.left = arrayToTree(array, 2*i+1, height)
  node.right = arrayToTree(array, 2*i+2, height)
  return node
end

def bfs(node, queue = [])
  $arr << node.height if node.left.nil? || node.right.nil?
  queue << node.left unless node.left.nil?
  queue << node.right unless node.right.nil?
  bfs(queue.shift,queue) unless queue.empty?
end

ar = [1, 2, 0, 3, 0, 0, 0] #false
arr = [1, 0 ,2] #true
arrr = [1, 2, 3, 4, 0, 0, 5, 6, 0, 0, 0, 0, 0, 0, 7] #false
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0, 0, 10, 0, 0] #true

$arr = []
bfs(arrayToTree(ar))
print $arr
puts $arr.max - $arr.min < 2

$arr = []
bfs(arrayToTree(arr))
print $arr
puts $arr.max - $arr.min < 2

$arr = []
bfs(arrayToTree(arrr))
print $arr
puts $arr.max - $arr.min < 2

$arr = []
bfs(arrayToTree(a))
print $arr
puts $arr.max - $arr.min < 2
