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

  def add(node)
    @nodes[node.data] = node
  end

  def fromArray(ar)
    ar.each_with_index do |val,i|
      add(Node.new(i,val))
    end
  end

  def bfs(start = 0, queue = [], output = [])

    node = nodes[start]

    unless node.visited
      output.push(node.data)
      node.connections.each {|conn| queue.push(conn) unless nodes[conn].visited }
      node.visited = true
    end

    bfs(queue.shift(),queue, output) unless queue.empty?

    #End of bfs execution
    unvisit_nodes
    output
  end

  private

  def unvisit_nodes
    nodes.values.each do |node|
      node.visited = false
    end
  end
end