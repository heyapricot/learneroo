class Node

  @@graph = Hash.new()

  attr_accessor :data, :visited, :connections

  def initialize(data, connections = [])
    @data = data
    @connections = connections
    @@graph[data] = self
  end

  def self.get(data)
    @@graph[data]
  end
end


def array2graph(nodeArray)
  nodeArray.length.times do |i|
    Node.new(i,nodeArray[i])
  end
end

def bfs(start = 0, queue = [])


  node = Node.get(start)

  unless node.visited
    print "#{node.data} "
    node.connections.each {|conn| queue.push(conn) unless Node.get(conn).visited }
    node.visited = true
  end

  bfs(queue.shift(),queue) unless queue.empty?


end

conns = [[2], [4], [5, 0, 3], [2], [1, 5], [4, 2]]
second = [[1, 2], [0, 2], [0, 1, 3, 4, 5], [2, 4], [3, 2], [2]]
third = [[1, 2], [0, 3, 4], [0, 5, 6], [1], [1], [2], [2]]
fourth = [[1, 2], [0, 3, 4], [0, 5, 6], [1], [1, 5], [2, 4], [2]]

array2graph(second)
bfs
puts

array2graph(conns)
bfs
puts

array2graph(third)
bfs
puts

array2graph(fourth)
bfs
puts

