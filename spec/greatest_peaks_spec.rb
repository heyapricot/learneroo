require_relative '../lib/greatest_peaks'

def adjacent_values(input, rows, columns, idx)

  x = idx % columns
  y = idx / rows

  conns = Array.new

  conns << input[idx - 1] unless x == 0 #Left
  conns << input[idx + 1] unless x == columns - 1 #Right
  conns << input[idx - rows] unless y == 0 #Up
  conns << input[idx + rows] unless y == rows - 1 #Down

  conns
end

describe "Kingdom Map" do
  describe "fromArray" do

    input =  [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14 , 15]]
    km = GreatestPeaks::KingdomMap.new
    km.fromArray(input.flatten,4,4)

    it "stores every value of the array as a Node in a Hash with the coordinates in the Array as key" do
      expect(km.nodes.keys.length).to eq input.flatten.length
      expect(km.nodes.values.map{|nod| nod.data}).to match_array(input.flatten)
    end

    it "Saves the connection to the nodes that are up, down, left and right" do
      km.nodes.values.each_with_index do |nod,idx|
        expect(nod.connections.map{|n| n.data}).to match_array(adjacent_values(input.flatten,input.length,input.first.length,idx))
      end

    end
  end
end