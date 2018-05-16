class Node
  attr_accessor :data, :location, :connections

  def initialize
    @connections = Array.new #[node[1],node[4]]
    @location = Array.new #[[col],[row]]
  end
end

class Matrix
  attr_accessor :nodes

  def initialize
    @nodes = Array.new #nodes[0], nodes[1],......
  end

  def self.array2matrix(arrays)
    #takes in an NXN array and makes nodes of each and stores them as a Matrix
    n = arrays.length
    matrix = Matrix.new
    arrays.each_with_index do |row, row_idx|
      row.each_with_index do |value, col_idx|
        node = Node.new
        node.data = value
        node.location = [col_idx, row_idx]
        matrix.nodes << node
      end
    end
    connect_matrix(matrix, n)
  end

  def self.connect_matrix(matrix, n)
    #Get the adjacent column connections
    matrix.nodes.each_with_index do |node, col|
      case col % n
      when 0
        #If I'm on the first column just add the element on the right
        node.connections.push(matrix.nodes[col + 1])
      when n - 1
        #If I'm on the last column just add the element on the left
        node.connections.push(matrix.nodes[col - 1])
      else
        #If I'm not at the border add left and right
        node.connections.push(matrix.nodes[col - 1])
        node.connections.push(matrix.nodes[col + 1])
      end
    end
    # Get the adjacent row connections by transposing the matrix
    grid = matrix.nodes.each_slice(n).to_a
    transposed_nodes = grid.transpose.flatten
    transposed_nodes.each_with_index do |node, row|
      case row % n
      when 0
        #first column connect node to the right
        node.connections.push(transposed_nodes[row + 1])
      when n - 1
        #last column connect node to the left
        node.connections.push(transposed_nodes[row - 1])
      else
        #If I'm not at the border add left and right
        node.connections.push(transposed_nodes[row - 1])
        node.connections.push(transposed_nodes[row + 1])
      end
    end
    matrix
  end

  def self.depth_first_search(node, directions = [])
    directions << node.location
    return directions if node.data == 9
    node.connections.each do |conn|
      if conn.data != 1 && !directions.include?(conn.location)
        depth_first_search(conn, directions)
      end
    end
    directions << [false]
  end
end

def escape(maze)
  matrix = Matrix.array2matrix(maze)
  Matrix.depth_first_search(matrix.nodes[0], solutions = [])
  print solutions
end


tests = Array.new
tests << [[0, 0, 0, 0, 0],
          [0, 1, 0, 1, 0],
          [0, 1, 0, 1, 1],
          [0, 1, 0, 0, 0],
          [0, 0, 0, 1, 9]]
tests << [[0, 0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 1, 0, 0],
          [0, 1, 1, 1, 1, 1, 1],
          [0, 0, 0, 0, 0, 0, 9],
          [0, 1, 1, 1, 1, 0, 0],
          [0, 0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 1, 0, 0]]
tests << [[0, 0, 0],
          [0, 1, 9],
          [0, 0, 0]]
tests << [[0, 0, 0, 0, 0, 1, 0, 0, 0],
          [0, 1, 0, 1, 0, 1, 1, 0, 1],
          [0, 1, 0, 1, 0, 0, 0, 0, 0],
          [1, 1, 0, 1, 1, 1, 0, 1, 1],
          [0, 0, 0, 0, 0, 1, 0, 0, 1],
          [1, 1, 1, 1, 0, 1, 1, 1, 1],
          [0, 0, 0, 0, 0, 0, 0, 0, 1],
          [0, 1, 1, 0, 0, 1, 1, 0, 9],
          [0, 0, 1, 0, 0, 0, 0, 0, 0]]

outputs = Array.new
outputs << [[0, 0],[1, 0],[2, 0],[2, 1],[2, 2],[2, 3],[3, 3],[4, 3],[4, 4]]
outputs << [[0, 0],[0, 1],[0, 2],[0, 3],[1, 3],[2, 3],[3, 3],[4, 3],[5, 3],[6, 3]]
outputs << [[0, 0],[1, 0],[2, 0],[2, 1]]
outputs << [[0, 0],[1, 0],[2, 0],[2, 1],[2, 2],[2, 3],[2, 4],[3, 4],[4, 4],[4, 5],[4, 6],[5, 6],[6, 6],[7, 6],[7, 7],[8, 7]]

#tests.each{ |arg| escape(arg) }
escape(tests[1])
