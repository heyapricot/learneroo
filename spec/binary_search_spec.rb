require_relative "../lib/binary_search"

describe "binary_search" do
  let(:success_tests){[[0,2,3,7,9,11],[-4,-2,0,2,4,6,8,10],[-25,-20,-15,-10,-5,5,7,8,9,10,11,12]]}
  let(:results){[0,4,5]}
  let(:failure){[[3,5,7,9,11,13,17],[1,2,3,4,5,6,7,8,9,10],[-20,-15,-11,2,5,7,10,11,12,13,14,14]]}

  it "returns the number where ar[idx] = idx" do
    success_tests.each_with_index{|t,idx| expect(binary_search(t)).to eq(results[idx])}
  end

  it "returns -1 if it can't find ar[idx] = idx" do
    failure.each{|t| expect(binary_search(t)).to eq(-1)}
  end
end