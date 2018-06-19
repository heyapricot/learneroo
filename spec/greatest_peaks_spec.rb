require_relative '../lib/greatest_peaks'

describe "Kingdom Map" do
  describe "fromArray" do

    let(:input) {	[[2, 6, 9, 11], [7, 8, 9, 8], [6, 7, 12, 9], [10, 7, 6, 4]]}
    let(:km) {GreatestPeaks::KingdomMap.new}

    it "stores every value of the array as a Node in a Hash with the coordinates in the Array as key" do
      km.fromArray(input)
      expect(km.nodes.keys.length).to eq input.flatten.length
      input.each_with_index do |row, ridx|
        row.each_with_index {|n,cidx| expect(km.nodes[[cidx,ridx]]).to eq(n)}
      end

    end
  end
end