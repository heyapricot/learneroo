require_relative "../../lib/sorting/mergesort"

describe "mergesort" do
  let(:ar){[[1, 3, 9, 11, 2, 4, 6, 8],[-3, 2, 2, 2, 4, -2, 0, 1, 5, 7],[-4, -3, -1, 1, 3, 0, 5, 7, 9, 11],[21, 32, 45, 62, 71, 83, 1, 3, 4, 7, 9, 12],[-91, -4, 42, 121, 265, 530, -623, -54, -7, 651, 721, 850]]}
  let(:result){["1 2 3 4 6 8 9 11", "-3 -2 0 1 2 2 2 4 5 7", "-4 -3 -1 0 1 3 5 7 9 11", "1 3 4 7 9 12 21 32 45 62 71 83", "-623 -91 -54 -7 -4 42 121 265 530 651 721 850"]}
  it "sorts the array" do
    ar.each_with_index {|r,idx | expect(mergesort(r).join(" ")).to eq(result[idx])}
  end
end