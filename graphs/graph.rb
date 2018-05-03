class Node

  @@graph = Hash.new()

  attr_accessor :data, :visited, :connections

  def initialize(data, connections = [])
    @data = data
    @visited = false
    @connections = connections
    @@graph[data] = self
  end

  def self.get(data)
    @@graph[data]
  end

  def self.graph
    @@graph
  end
end

def arrayToGraph(nodeArray)
  nodeArray.length.times do |i|
    Node.new(i,nodeArray[i])
  end
end