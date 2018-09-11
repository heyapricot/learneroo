require_relative '../lib/goofspiel'
describe "goofspiel" do
  let(:tests){[[1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 1],[1, 2, 4, 3, 5, 1, 2, 6, 9, 7, 10, 1, 2, 11, 11, 4, 13, 12, 3, 10, 3, 7, 12, 13, 8, 12],[2, 1, 3, 2, 4, 3, 5, 5, 6, 4, 1, 5, 7, 6, 8, 7, 9, 8, 10, 9, 11, 11, 12, 12, 13, 13, 1, 10, 12, 11, 13, 12, 5, 13],[1, 2, 4, 3, 5, 1, 2, 6, 9, 7, 8, 8, 10, 1, 13, 13, 12, 12, 2, 11, 13, 13, 12, 12, 11, 4, 13, 12, 3, 10, 9, 7, 12, 13, 8, 12]]}
  let(:results){["13 78", "41 60", "73 28", "46 49"]}
  it "prints the score of every player based on the bids" do
    tests.each_with_index do |t,idx|
      expect(goofspiel(t).join(" ")).to eq results[idx]
    end
  end
end