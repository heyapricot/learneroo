class Map
  attr_accessor :nodes

  def initialize
    @nodes = Array.new
  end

  def add(node)
    @nodes.push(node)
  end

  def fromArray(ar)
    ar.each do |row|
      row.each do |elem|
        add(Node.new(elem))
      end
    end
  end

end