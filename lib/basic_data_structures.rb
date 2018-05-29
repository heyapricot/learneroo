module DataStructures
  class Node
    attr_accessor :next, :data

    def initialize(num = nil)
      @data = num
    end
  end

  class LinkedList
    attr_accessor :head, :tail

    def initialize(head = nil)
      @tail = @head unless head.nil?
    end

    def add(num)
      if @head.nil?
        @head = Node.new(num)
        @tail = @head
      elsif @tail == @head
        @head.next = @tail = Node.new(num)
      else
        @tail = @tail.next = Node.new(num)
      end
    end

    def get(num)

      current_node = @head

      num.times do
        current_node = current_node.next
      end
    end

  end

  class Stack

    attr_reader :max

    def initialize
      @list = LinkedList.new
    end


    def push(num)
      @list.add(num)
      @max = num if @max.nil? || num > @max

    end

    def pop
      if @list.head == @list.tail
        output = @list.head.data
        @head = nil
        output
      else
        node = @list.head

        while node.next != @list.tail
          node = node.next
        end

        output = node.next.data
        @list.tail = node
        @list.tail.next = nil
        output
      end

    end
  end

  class Queue
    def initialize
      @list = LinkedList.new
    end

    def push(num)
      @list.add(num)
    end

    def dequeue

      unless @list.head.nil?
        output = @list.head.data

        unless @list.head == @list.tail
          @list.head = @list.head.next
        else
          @list.head = nil
        end
      else
        output = -1
      end

      output
    end

  end

end