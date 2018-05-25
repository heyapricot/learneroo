require_relative "../linked_list/linked_list"

module Stack
  class Stack
    include LinkedList

    def initialize
      @list = LinkedList.new
    end

    def push(num)
      @list.add(num)
    end

    def pop

      node = @list.head

      while node.next != @list.tail
        node = node.next
      end

      output = node.next.data.dup
      @list.tail = node
      @list.tail.next = nil
      output
    end

  end
end