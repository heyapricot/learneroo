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
  connections.length.times { |i| Node.new(i) }
  connections.each_with_index { |conn, idx| conn.each { |c| Node.graph[idx].connections[c] = Node.graph[c] } }
end

def dfs(node)
# Print the value of the Node N.
# Mark N as visited.
# Get all the adjacent nodes to N.
# Call BFS on adjacent Nodes one at a time unless visited.
  $cycle << node.data
  node.visited = true
  node.connections.each_value { |conn| dfs(conn) unless conn.visited }
end

def do_stuff(conns)
  $cycle = []
  array2graph(conns)
  node = Node.graph[0]
  dfs(node)
  puts conns.size == $cycle.size
end

do_stuff([[2], [4], [5, 0, 3], [5, 2], [1, 5], [4, 2, 3]]) #true
do_stuff([[1, 2],[0, 4],[0, 4],[5, 6],[1, 2, 7],[3],[3],[4]]) #false
