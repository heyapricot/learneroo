require_relative '../lib/graphs/graph'
module GreatestPeaks
  include Graph

  class KingdomMap < Graph
    def fromArray(ar)
      #rq -> Row quantity
      rq = ar.length
      #cq -> Column quantity
      cq = ar.first.length

      @nodes = Hash.new
      ar.each_with_index {|row, ridx| row.each_with_index {|col, cidx| @nodes[[cidx,ridx]] = Graph::Node.new(col) } }

      #Get the connections
      @nodes.length.times do |n|
        x = n / cq
        y = n % rq

        @nodes[[x,y]].connections << @nodes[[x - 1 , y]] unless x == 0
        @nodes[[x,y]].connections << @nodes[[x + 1 , y]] unless x == cq - 1
        @nodes[[x,y]].connections << @nodes[[x , y]] unless y == 0
        @nodes[[x,y]].connections << @nodes[[x , y]] unless y == rq - 1

      end
    end
  end

end

