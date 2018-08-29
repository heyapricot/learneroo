module Node
  class Node
    attr_reader :id
    attr_accessor :visited

    def initialize(id = nil, data = nil)
      @id = id
      @data = data
      @visited = false
    end
  end
end