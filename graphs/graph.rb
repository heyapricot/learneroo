class Node

  attr_accessor :data, :visited, :connections

  def initialize(data, connections = [])
    @data = data
    @visited = false
    @connections = connections
  end

end

class Graph

  attr_accessor :nodes

  def initialize
    @nodes = Hash.new
  end

  def addNode(node)
    @nodes[node.data] = node
  end

  def getNode(data)
    @nodes[data]
  end

  def self.fromArray(ar)
    ar.length.times do |i|
      Node.new(i,ar[i])
    end
  end
end