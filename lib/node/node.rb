module Node
  class Node
    attr_reader :id
    attr_accessor :visited

    def initialize(id = nil)
      @id = id
      @visited = false
    end
  end
end