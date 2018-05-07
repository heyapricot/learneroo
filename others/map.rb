class Map
  attr_accessor :nodes

  def initialize
    @nodes = Array.new
  end

  def add(node)
    @nodes.push(node)
  end

end