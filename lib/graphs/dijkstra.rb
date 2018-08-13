require_relative "../../lib/graphs/weighted_graphs"

def dijkstra(graph, id = 0)
  queue = [graph.get_node(id)]
  distance = Hash.new(Float::INFINITY)
  distance[id] = 0
  while not queue.empty?
    current = queue.shift
    graph.get_node_connections(current.id).sort_by{|key,weight| weight}.each do|node, weight|
      queue << node unless node.visited
      min_distance = distance[current.id] + graph.weight(node.id, current.id)
      distance[node.id] =  min_distance if min_distance < distance[node.id]
    end
    current.visited = true
  end
  distance
end

test = [[0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0], [0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0]]

wg = WeightedGraph.new
wg.from_matrix(test)

dijkstra(wg)