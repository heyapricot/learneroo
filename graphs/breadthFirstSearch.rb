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

  current = Node.get(start)
  print "#{current.data}"

  unless current.visited
    current.connections.each do |nod|
      queue.push(nod) unless Node.get(nod).visited
    end
  end

  current.visited = true

  if !queue.empty?
    bfs(queue.pop,queue)
  end

end

conns = [[2], [4], [5, 0, 3], [2], [1, 5], [4, 2]]
second = [[1, 2], [0, 2], [0, 1, 3, 4, 5], [2, 4], [3, 2], [2]]
third = [[1, 6], [2, 0, 3, 4], [3, 1], [6, 1, 2], [1, 5, 6], [4], [4, 3, 0]]

array2graph(second)
bfs
puts



