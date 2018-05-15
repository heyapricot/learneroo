class Node

  attr_accessor :data, :visited, :connections, :coordinates

  def initialize(data, connections = [], coordinates = [])
    @data = data
    @visited = false
    @connections = connections
    @coordinates = coordinates
  end

end