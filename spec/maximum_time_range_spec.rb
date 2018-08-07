require_relative "../lib/maximum_time_range"

describe "maximum_time_range" do
  let(:tests){[[10, 18, 4, 6, 14, 16, 5, 8],[5, 14, 1, 4, 13, 19, 3, 6, 9, 8],[11, 12, 4, 7, 14, 16, 0, 2, 13, 15, 8, 10],[0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5]]}
  let(:results){["[4, 8] [10, 18] ","[1, 19] ", "[0, 2] [4, 7] [8, 10] [11, 12] [13, 16] ","[0, 1] [3, 16] "]}

  it "delivers the events that allow for maximum stay" do
    tests.each_with_index do |t,idx|
      s = ""
      maximum_time_range(t).each {|r| s << r.to_s + " "}
      expect(s).to eq(results[idx])
    end
  end
end