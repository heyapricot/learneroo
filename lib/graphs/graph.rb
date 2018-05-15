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
    nodes.clear
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

    output
  end

  def dfs(start = 0, output = [])
    node = nodes[start]
    output.push(node.data)
    node.visited = true
    node.connections.each {|conn| dfs(conn,output) unless nodes[conn].visited }

    output
  end

  def oneConnected?
    dfs.sort == nodes.keys.sort ? true : false
  end

  def hasCycle?(node = nodes.values.first, previous = nil, output = false)

    node.visited = true

    conns = node.connections.dup
    conns.delete(previous)

    conns.each do |conn|

      if nodes[conn].visited
        return true
      else
        output = hasCycle?(nodes[conn],node.data)
      end

    end

    output

  end

  def unvisit_nodes
    nodes.values.each do |node|
      node.visited = false
    end
  end

end