require_relative "../lib/time_schedule"

describe "time schedule" do
  let(:tests) do
    [
        [4, 8, 1, 3, 7, 9, 5, 6],
        [3, 8, 1, 2, 3, 9, 1, 5, 4, 5, 8, 14],
        [0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5],
        [2, 6, 5, 10, 7, 12, 0, 9, 4, 8]
    ]
  end

  let(:results) do
    [
        "[1, 3][5, 6][7, 9]",
        "[1, 2][4, 5][8, 14]",
        "[0, 1][3, 5][7, 9][10, 12][14, 16]",
        "[2, 6][7, 12]"
    ]
  end

  it "delivers the schedule with maximum number of elements (No overlaps)" do
    tests.each_with_index do |t,idx |
      s = ""
      time_schedule(t).each{|r| s << r.to_s}
      expect(s).to eq(results[idx])
    end
  end
end