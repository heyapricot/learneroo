require_relative '../../lib/hashes/sum_pairs'

describe "sum_pairs" do
  let(:tests){[[14,[1, 3, 5, 11]],[12,[1, 9, 11, 13, 2, 3, 7]],[21,[8, 17, 5, 11, 9, 6, 3, 2, 15]],[0,[-8, 7, 11, 8, 5, 9, 3, 6, 2, -9, 4]],[40,[17, -20, 21, -3, 33, 10, 6, -11, 19, 40, 11, 17, 56, 33, 72, 5, 1, 36, 51]]]}
  let(:results){["3 11", "1 11 9 3", "6 15", "-8 8 9 -9", "21 19 -11 51"]}
  it "returns the two numbers in the array that equal k" do
    tests.each_with_index do |t,idx|
      expect(sum_pairs(t).join(" ")).to eq results[idx]
    end
  end
end