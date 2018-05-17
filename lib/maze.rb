require_relative "node"

class Maze


  attr_accessor :cells
  attr_reader :shortest

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

  def explore(start = [0,0], output = [], stack = [])
    node = @cells[start]

    output.push(node.coordinates)
    node.visited = true

    node.connections.each do|conn|

      unless conn.visited || conn.data == 1
        explore(conn.coordinates,output)
      end

    end

    if node.data == 9
      @shortest = output.dup
    end

    output.pop
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