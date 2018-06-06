module Tree
  class Node
    attr_accessor :data, :left, :right

    def initialize(data = nil, left = nil, right = nil)
      @data = data
      @left = left
      @right = right
    end

  end

  class Tree
    attr_accessor :head

    def initialize(head_data = nil)
      @head = Node.new(head_data) unless head_data.nil?
    end

    def fromArray(array, idx = 0, node = @head = Node.new)

      node.data = array[idx]

      unless (2 * idx) + 1 > (array.length - 1)
        fromArray(array, (2 * idx) + 1, node.left = Node.new)
        fromArray(array, (2 * idx) + 2, node.right = Node.new)
      end

    end

    def preOrder(node = @head, output = [])
      output.push(node.data)
      preOrder(node.left,output) unless node.left.nil? || node.left.data == 0
      preOrder(node.right,output) unless node.right.nil? || node.right.data == 0

      output
    end

  end
end