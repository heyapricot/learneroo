class Node
  @@graph = Hash.new()

  attr_accessor :data, :connections, :visited

  def initialize(data)
    @data = data
    @connections = Hash.new
    @visited = false
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

  connections.each_with_index do |conn, idx|
    conn.each do |c|
      Node.graph[idx].connections[c] = Node.graph[c]
    end
  end
end

def dfs(node)
#   Print the value of the Node N.
# Mark N as visited.
# Get all the adjacent nodes to N.
# Call DFS on every adjacent Node that's not visited.
  print "#{node.data} "
  node.visited = true
  node.connections.each_value do |conn|
    dfs(conn) unless conn.visited
  end
end

def do_stuff
  conns = [[2], [4], [5, 0, 3], [5, 2], [1, 5], [4, 2, 3]]

  array2graph(conns)
  node = Node.graph[0]
  dfs(node)
end

puts do_stuff
