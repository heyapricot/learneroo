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

    input =  [[2, 6, 9, 11], [7, 8, 9, 8], [6, 7, 12, 9], [10, 7, 6, 4]]
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

    it "Stores the 'peaks' in an instance variable" do
      expect(km.peaks.map{|nod| nod.data}).to match_array([11,12,10])
    end

    it "Stores the dominance area of the peaks" do
      expect(km.areas.keys.map{|nod| nod.data}).to match_array([11,12,10])
      expect(km.areas.values.map{|v|v.length}).to match_array([3,4,9])
    end
  end


end