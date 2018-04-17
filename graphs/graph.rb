class Node

  @@graph = Hash.new()

  attr_accessor :data, :connections

  def initialize(data)
    @data = data
    @connections = Hash.new
    @@graph[data] = self
  end

  def self.graph
    @@graph
  end
end


def array2graph(connections)
  connections.length.times do |i|
    Node.new(i)
  end

  idx = 0
  connections.each do |conn|
    conn.each do |c|
      Node.graph[idx].connections[c] = Node.graph[c]
    end
    idx+=1
  end

end


conns = [[2], [4], [5, 0, 3], [5, 2], [1, 5], [4, 2, 3]]

array2graph(conns)



