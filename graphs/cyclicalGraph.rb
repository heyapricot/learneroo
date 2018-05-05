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
# find if at least a triangle cycle
# can you the graph get back to original node through its connections
  node.visited = true
  node.connections.each_value do |conn|
    if conn.visited
      print "#{conn.data} "
      $cycle << conn.data unless node.connections[0] == conn
    else
      dfs(conn)
    end
  end
end

def do_stuff(conns)
  $cycle = []
  array2graph(conns)
  node = Node.graph[0]
  dfs(node)
  puts $cycle != $cycle.uniq
end

do_stuff([[2], [4], [5, 0, 3], [5, 2], [1, 5], [4, 2, 3]]) #true
do_stuff([[1, 2],[0, 3, 4],[0, 5, 6],[1],[1],[2],[2]]) #false
do_stuff([[2],[3, 4],[0, 5],[5, 1],[1],[2,3]]) #false
