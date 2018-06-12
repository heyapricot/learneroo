module Graph
  class Node
    attr_accessor :data, :left, :right, :connections, :visited

    def initialize(data = nil, connections = [])
      @data = data
      @connections = connections
      @left = @connections[0]
      @right = @connections[1]
      @visited = false
    end

  end

  class Tree
    attr_accessor :head

    def initialize(head_data = nil)
      @head = Node.new(head_data) unless head_data.nil?
    end

    def fromArray(array, idx = 0, node = @head = Node.new)

      node.data = array[idx]

      l = (2 * idx) + 1
      r = (2 * idx) + 2

      fromArray(array,l, node.left = Node.new) unless l > (array.length - 1) || array[l] == 0
      fromArray(array,r, node.right = Node.new) unless r > (array.length - 1) || array[r] == 0

    end

    def preOrder(node = @head, output = [])
      output.push(node.data)
      preOrder(node.left,output) unless node.left.nil?
      preOrder(node.right,output) unless node.right.nil?

      output
    end

    def isBalanced?(node = @head)

      result = (leftCount(node) - rightCount(node)).abs <= 1
      result = result && isBalanced?(node.left) unless node.left.nil?
      result = result && isBalanced?(node.right) unless node.right.nil?
      return  result

    end

    private

    def leftCount(node = @head)
      node.left.nil? ? 0 : leftCount(node.left) + 1
    end

    def rightCount(node = @head)
      node.right.nil? ? 0 : rightCount(node.right) + 1
    end

  end

  class Graph

    attr_accessor :nodes

    def initialize
      @nodes = Hash.new
    end

    def add(node)
      @nodes[node.data] = node
    end

    def fromArray(ar)
      nodes.clear
      ar.each_with_index do |val,i|
        add(Node.new(i,val))
      end
    end

    def bfs(start = 0, queue = [], output = [])

      node = nodes[start]

      unless node.visited
        output.push(node.data)
        node.connections.each {|conn| queue.push(conn) unless nodes[conn].visited }
        node.visited = true
      end

      bfs(queue.shift(),queue, output) unless queue.empty?

      output
    end

    def dfs(start = 0, output = [])
      node = nodes[start]
      output.push(node.data)
      node.visited = true
      node.connections.each {|conn| dfs(conn,output) unless nodes[conn].visited }

      output
    end

    def oneConnected?
      dfs.sort == nodes.keys.sort ? true : false
    end

    def hasCycle?(node = nodes.values.first, previous = nil, output = false)

      node.visited = true

      conns = node.connections.dup
      conns.delete(previous)

      conns.each do |conn|

        if nodes[conn].visited
          return true
        else
          output = hasCycle?(nodes[conn],node.data)
        end

      end

      output

    end

    def unvisit_nodes
      nodes.values.each do |node|
        node.visited = false
      end
    end

  end

end