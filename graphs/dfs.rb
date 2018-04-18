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
  

end

conns = [[2], [4], [5, 0, 3], [5, 2], [1, 5], [4, 2, 3]]

array2graph(conns)
node = Node.graph[0]
dfs(node)
