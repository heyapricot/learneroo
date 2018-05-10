class Map
  attr_accessor :nodes

  def initialize
    @nodes = Array.new
  end

  def add(node)
    @nodes.push(node)
  end

  def fromArray(ar)

    rows = ar.length
    columns = ar[0].length

    ar.flatten.each do |elem|
      add(Node.new(elem))
    end

    makeConnections(rows,columns)

  end

  def is_peak(node)
    node.data > node.connections.max ? true : false
  end

  #2 runs, first run creates the nodes from the array data
  # Second run stores the connections



  private

  def makeConnections(rows, columns)

    # Get the adjacent row connections
    grid = nodes.each_slice(rows).to_a
    transposed_nodes = grid.transpose.flatten
    transposed_nodes.each_with_index do |node, row|
      case row % rows
      when 0
        #If I'm on the first column just add the element on the right
        node.connections.push(transposed_nodes[row + 1])
      when rows - 1
        #If I'm on the last column just add the element on the left
        node.connections.push(transposed_nodes[row - 1])
      else
        #If I'm not at the border add left and right
        node.connections.push(transposed_nodes[row - 1])
        node.connections.push(transposed_nodes[row + 1])
      end
    end
  end

  def getConnections(rows, columns)
    row_idx = 0

    #Get the adjacent column connections
    nodes.each_with_index do |node, idx|

      horizontal_connections(node, idx, columns)
      vertical_connections(node,idx,row_idx,rows)

      row_idx += 1 if idx % rows == 0

    end
  end

  def horizontal_connections(node, col_idx, col_length)
    case col_idx
    when 0
      #If I'm on the first column just add the element on the right
      node.connections.push(nodes[col_idx + 1])
    when col_length - 1
      #If I'm on the last column just add the element on the left
      node.connections.push(nodes[col_idx - 1])
    else
      #If I'm not at the border add left and right
      node.connections.push(nodes[col_idx - 1])
      node.connections.push(nodes[col_idx + 1])
    end
  end

  def vertical_connections(node, col_idx, row_idx, row_length)
    case row_idx
    when 0
      node.connections.push(nodes[col_idx + ((row_idx + 1) * row_length)])
    when row_length - 1
      node.connections.push(nodes[col_idx + ((row_idx - 1) * row_length)])
    else
      node.connections.push(nodes[col_idx + ((row_idx + 1) * row_length)])
      node.connections.push(nodes[col_idx + ((row_idx - 1) * row_length)])
    end
  end

end
