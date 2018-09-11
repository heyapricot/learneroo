require_relative "../../lib/node/node"

class WeightedGraph

  def initialize
    @node_list = Hash.new
    @connection_list = Hash.new
  end

  def from_matrix(array)
    array.length.times{|n| add_node(n)}
    set_connections(array)
  end

  def add_node(identifier, data = nil)
    node = Node::Node.new(identifier, data)
    @node_list[identifier].nil? ? @node_list[identifier] = [node] : @node_list[identifier] << node
    @connection_list[node] = Hash.new
  end

  def get_node(identifier)
    nodes_array = @node_list[identifier]
    nodes_array.first if nodes_array.length == 1
  end

  def get_node_connections(node)
    #Returns a hash
    @connection_list[node]
  end

  def nodes
    @node_list.keys
  end

  def connections
    @connection_list.map do |origin,hash|
      hash.map{|destiny,weight| weight.nil? ? [origin.id,destiny.id] : [[origin.id,destiny.id],weight]  }
    end
  end

  def dijkstra(id = 0)
    queue = [get_node(id)]
    distance = Hash.new(Float::INFINITY)
    distance[get_node(id)] = 0
    while not queue.empty?
      current = queue.shift
      get_node_connections(current).each do |node, weight|
        queue << node unless node.visited
        min_distance = distance[current] + weight(node, current)
        distance[node] =  min_distance if min_distance < distance[node]
      end
      current.visited = true
    end
    distance
  end

  def bfs(id = 0, queue = [], paths = Hash.new([id]), previous = id)
    current = get_node(id)
    current.visited = true
    #previous = id
    get_node_connections(current).keys.select{|conn| !conn.visited }.each do |conn|
      paths[conn.id] = paths[id].dup + [conn.id]
      queue << conn.id unless conn.visited or queue.include?(conn.id)
      conn.visited = true
    end
    bfs(queue.shift, queue, paths, previous) unless queue.empty?
    paths
  end

  def prim_mst(id = 0)
    visited_nodes = []
    nodes_key_value = Hash.new(Float::INFINITY)
    nodes_key_value[id] = 0
    while visited_nodes.length != nodes.length
      current = nodes_key_value.select{|id,weight| !visited_nodes.include?(id) }.sort_by{|id,weight| [weight,id]}.first.first
      current = get_node(current)
      visited_nodes << current.id
      get_node_connections(current).each do |node, weight|
        nodes_key_value[node.id] = weight if weight < nodes_key_value[node.id] and !visited_nodes.include?(node.id)
      end
    end
    visited_nodes.shift
    visited_nodes.map{|id| nodes_key_value[id] }
  end

  private

  def add_connection(origin, destiny, weight = nil)
    org = get_node(origin)
    des = get_node(destiny)
    hash = @connection_list[org]
    hash[des] = weight
  end

  def set_connections(matrix)
    matrix.each_with_index do |row, row_idx|
      row.each_with_index {|weight, col_idx| add_connection(row_idx,col_idx, weight) unless weight == 0}
    end
  end

  def weight(origin,destiny)
    get_node_connections(origin)[destiny]
  end

end
