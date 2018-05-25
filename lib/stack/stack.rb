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
      output = @list.tail.data.dup
      @list.tail.data = nil
      output
    end

  end
end