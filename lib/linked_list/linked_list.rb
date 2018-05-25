module LinkedList
  class Node

    attr_accessor :next, :data

    def initialize(num = nil)
      @data = num
    end
  end

  class LinkedList

    attr_accessor :head, :tail

    def initialize(head = nil)
      @head = Node.new if @head.nil?
    end

    def add(num)
      if @tail.data.nil?
        @tail = Node.new(num)
      else
        @tail.next = Node.new(num)
      end
    end

    def get(num)

      current_node = @head

      num.times do
        current_node = current_node.next
      end
    end

  end
end