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
      @cells[cell.coordinates] = cell
    end

    getConnections(numRows,numCols)

  end


  private

  def getConnections(numRows,numCols)

    @cells.values.each do |cell|
      x = cell.coordinates[0]
      y = cell.coordinates[1]

      cell.connections.push(@cells[[x + 1, y]]) unless x == (numCols - 1)
      cell.connections.push(@cells[[x,y + 1]]) unless y == (numRows - 1)
    end

  end
end