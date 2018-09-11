require_relative '../../lib/graphs/tree'

describe "no_recursion_level_count" do
  let(:tests){[[2,7,5,2,6,0,9],[1,7,5,2,6,0,9,3,7,5,11,0,0,4,0],[5,3,2,9,0,0,7,0,0,0,0,0,0,5,0],[1,2,3,4,0,5,6,7,8,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0]]}
  let(:results){[3,4,4,5]}
  it "returns the number of levels of the tree" do
    tests.each_with_index do |t,idx|
      tree = Tree.new
      tree.from_array(t)
      expect(tree.no_recursion_level_count).to eq results[idx]
    end
  end
end