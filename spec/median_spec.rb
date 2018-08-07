require_relative "../lib/median"

describe "median" do
  let(:tests) do
    [
        [0, 1, 2, 4, 6, 5, 3],
        [0, 1, 2, 4, 6, 5, 3, 8, 9],
        [7672, 271, 595, 8906, 1715, 509, 3131, 747, 6663, 5747, 9216, 2830, 5256, 8343, 2185, 839, 7399, 6780, 5754, 4953, 1900, 7752, 5466, 6348, 5783, 4895, 6463, 4655, 8873, 2931, 8912, 3794, 9421, 1082, 4541, 8451, 9862, 5389, 3190, 6894, 3345, 4865, 6587, 7552, 1433, 5276, 3096, 6606, 5475, 368, 2867, 5487, 5905, 5973, 6487, 816, 3036, 8379, 9856, 7390, 4710, 2521, 6906, 6883, 6492, 4910, 7944, 7317, 6836, 1075, 3500, 3504, 7778, 3487, 9073, 4497, 7169, 1097, 2861, 2460, 6418, 3167, 1573, 1346, 5111, 9257, 3463, 5311, 6685, 7845, 3111, 5741, 8566, 1459, 6570, 3458, 3023, 5437, 5750, 6167, 9152]
    ]
  end

  let(:results){[3,4,5437]}

  it "Gets the median without sorting the whole algorithm" do
    tests.each_with_index {|t,idx| expect(quickselect(t)).to eq(results[idx])}
  end
end