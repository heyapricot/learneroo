module Tree
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

end