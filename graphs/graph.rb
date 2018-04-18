class Node

  @@graph = Hash.new()

  attr_accessor :data, :connections

  def initialize(data)
    @data = data
    @connections = Hash.new
    @@graph[data] = self
  end

  def self.graph
    @@graph
  end
end


def array2graph(connections)
  connections.length.times do |i|
    Node.new(i)
  end

  idx = 0
  connections.each do |conn|
    conn.each do |c|
      Node.graph[idx].connections[c] = Node.graph[c]
    end
    idx+=1
  end

end

def recurPrint(target,list = nil)



  conns = node.connections.values
  print node.data

  if node.data == target
    return
  else
      recurPrint(conn,target)
  end
end

def recurprint(target,ar,val = 0)
  print val
  var = ar[val].shift
  if target == var
    print var
  else
    recurprint(target,ar,var)
  end
end


conns = [[2], [4], [5, 0, 3], [5, 2], [1, 5], [4, 2, 3]]
second = [[1, 2], [2, 0], [3, 0, 1, 4, 5], [4, 2], [3, 2], [2]]
third = [[1, 6], [2, 0, 3, 4], [3, 1], [6, 1, 2], [1, 5, 6], [4], [4, 3, 0]]





#array2graph(conns)
recurprint(4,conns)
puts
recurprint(4,second)
puts
recurprint(4,third)



