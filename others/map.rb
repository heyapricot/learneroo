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

    #Get the adjacent column connections
    nodes.each_with_index do |node, col|
      case col % columns
      when 0
        #If I'm on the first column just add the element on the right
        node.connections.push(nodes[col + 1])
      when columns - 1
        #If I'm on the last column just add the element on the left
        node.connections.push(nodes[col - 1])
      else
        #If I'm not at the border add left and right
        node.connections.push(nodes[col - 1])
        node.connections.push(nodes[col + 1])
      end
    end
    #Get the adjacent row connections

  end

end
