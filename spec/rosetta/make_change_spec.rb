require_relative '../../lib/rosetta/make_change'
describe "make_change" do
  let(:tests){[15,25,42,52,100]}
  let(:results){[6,13,31,49,242]}
  let(:coins){[1,5,10,25]}

  it "returns the number of possible combinations to reach the target" do
    tests.each_with_index do |t,idx|
      expect(count_change(t, coins)).to eq results[idx]
    end
  end
end