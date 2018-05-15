require_relative "../others/greatest_peaks"

describe "#greatest_peaks" do
  let(:tests) do
    tests = Array.new
    tests.push([[9, 8, 5], [5, 6, 3], [8, 4, 1]])
    tests.push([[8, 12], [9, 3]])
    tests.push([[2, 6, 9, 11], [7, 8, 9, 8], [6, 7, 12, 9], [10, 7, 6, 4]])
    tests.push([[4, 3, 2, 1], [2, 1, 0, 5], [0, 7, 4, 6], [10, 8, 4, 7]])
    tests.push([[3, 6, 9, 11, 3], [5, 8, 12, 4, 6], [7, 10, 13, 2, 14], [0, 1, 5, 9, 3], [2, 8, 6, 4, 0]])
  end
end
