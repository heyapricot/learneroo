require_relative '../../lib/sets/sets'

describe "find_duplucates" do
  let(:tests){[[1, 2, 3, 1, 5, 6, 7, 8, 5, 2], 	[3, 501, 17, 23, -43, 67, 5, 888, -402, 235, 77, 99, 311, 1, -43], [3, 443, 67, 25, 501, 917, 23, 888, -402, 235, 377, 99, 311, 443, 1], [4376, -345, -345, 4376, -345, 84945, 4376, -345, -26509], 	[2367, -65326, 134, -185007, 3291, 7832, -65326, 789, 980, -3289, 3490], [85, 105, 90, 275, 30, 100, 275, 110, 125, 130, 275, 10, 20, 30, 45, 50, 275, 65, 70, 111]]}
  let(:results){["1 5 2", "-43", "443", "-345 4376 -345 4376 -345", "-65326", "275 275 30 275"]}
  it "finds the numbers that appear more than once in an array" do
    tests.each_with_index do |t, idx|
      expect(find_duplicates(t).join(" ")).to eq(results[idx])
    end
  end
end