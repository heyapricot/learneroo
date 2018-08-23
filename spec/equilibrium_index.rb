require_relative '../lib/equilibrium_index'
describe "equilibrium_index" do
  let(:tests){[[-7,1,5,2,-4,3,0],[1,2,3,4,5,4,2,3,1],[-1,1,-2,3,-2,0,1,3,-2,3,-1],[2,6,-3,11,0,4,-8,0,13,4,3],[1,5,25,3,2,5,6,7,3,2,5,13,12,9,14,11]]}
  let(:results){["3 6", "4", "7", "4 6", "10"]}

  it "returns a list of indexes where the sum of the left elements equals the sum of the right elements" do
    tests.each_with_index do |t,idx|
      expect(equilibrium_index(t).join(" ")).to eq results[idx]
    end
  end

end