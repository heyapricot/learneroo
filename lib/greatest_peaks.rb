require_relative '../lib/graphs/graph'
module GreatestPeaks
  include Graph

  class KingdomMap < Graph
    def fromArray(ar)
      @nodes = Hash.new
      ar.each_with_index {|row, ridx| row.each_with_index {|col, cidx| @nodes[[cidx,ridx]] = Graph::Node.new(col) } }
    end
  end

end

