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


    def leftCount(node = @head)
      unless node.left.nil?
        count = leftCount(node.left)
        return count + 1
      else
        return 0
      end
    end


  end
end