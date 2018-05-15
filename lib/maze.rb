require_relative "node"

class Maze
  attr_accessor :cells

  def initialize(array = nil)
    @cells = Hash.new

    fromArray(array) unless array.nil?
  end

  def fromArray(array)
    #Get number of rows
    numRows = array.length
    #Get number of columns
    numCols = array.first.length
    # Iterate trough each element
    array.flatten.each_with_index do |elem, idx|

      cell = Node.new(elem)

      horPos = idx % numCols
      verPos = idx / numRows

      cell.coordinates = [horPos,verPos]
      cell.connections = getConnections(horPos,verPos,numRows,numCols)
      @cells[cell.coordinates] = cell

    end
  end


  private

  def getConnections(x,y,numRows,numCols)
    connections = Array.new

    connections.push([x + 1, y]) unless x == (numCols - 1)
    connections.push([x,y + 1]) unless y == (numRows - 1)

    return connections
  end
end