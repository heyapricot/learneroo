require_relative "../../lib/graphs/weighted_graphs"

class Tree < WeightedGraph

  def from_array(array)
    array.each_with_index{|n,idx| add_node(idx,n) if n != 0}
    set_connections(array)
  end

  def set_connections(array)
    length = array.length
    array.each_with_index do |n,idx|
      left = (2*idx)+1 if (2*idx)+1 < length
      right = (2*idx)+2 if (2*idx)+2 < length
      add_connection(idx, left) unless left.nil? || array[left] == 0
      add_connection(idx,right) unless right.nil? || array[right] == 0
    end
  end

  def no_recursion_level_count
    queue = []
    queue << get_node(0)
    height = 0

    while true
      node_quantity = queue.length
      if node_quantity == 0
        return height
      else
        height += 1
      end

      while node_quantity > 0
        node = queue.shift
        get_node_connections(node).keys.each{|conn| queue << conn}
        node_quantity -= 1
      end
    end
  end

  def bfs(id = 0, queue = [], &block)
    current = get_node(id)
    yield current
    get_node_connections(current).keys.each{ |conn| queue << conn unless conn.visited }
    bfs(queue.shift.id,queue, &block) unless queue.empty?
  end

end