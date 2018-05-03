require_relative "graph"

def bfs(start = 0, queue = [])


  node = Node.get(start)

  unless node.visited
    print "#{node.data} "
    node.connections.each {|conn| queue.push(conn) unless Node.get(conn).visited }
    node.visited = true
  end

  bfs(queue.shift(),queue) unless queue.empty?


end

conns = [[2], [4], [5, 0, 3], [2], [1, 5], [4, 2]]
second = [[1, 2], [0, 2], [0, 1, 3, 4, 5], [2, 4], [3, 2], [2]]
third = [[1, 2], [0, 3, 4], [0, 5, 6], [1], [1], [2], [2]]
fourth = [[1, 2], [0, 3, 4], [0, 5, 6], [1], [1, 5], [2, 4], [2]]

arrayToGraph(second)
bfs
puts

arrayToGraph(conns)
bfs
puts

arrayToGraph(third)
bfs
puts

arrayToGraph(fourth)
bfs
puts

