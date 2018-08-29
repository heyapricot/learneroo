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
    children_per_level = [0]
    visit_count = 0
    level = 0
    nodes.each do |current_node|
      if visit_count == children_per_level[-1]
        #I'm the last
        level += 1
        children_per_level.shift
      end
      child_count = get_node_connections(get_node(current_node)).length
      children_per_level.empty? ? children_per_level << child_count : children_per_level[-1] += child_count
      visit_count += 1
    end
    return level
  end

end

tree = Tree.new
tree.from_array([1,7,5,2,6,0,9,3,7,5,11,0,0,4,0])
puts tree.no_recursion_level_count