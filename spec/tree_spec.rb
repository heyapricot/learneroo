require_relative '../lib/trees/tree'


describe "Tree.preOrder" do

  let(:tree){Tree::Tree.new}

  it "returns an array with the tree elements in preOrder" do
    tree.fromArray([1,7,5,2,6,0,9,3,7,5,11,0,0,4,0])
    expect(tree.preOrder).to match_array([3,7,2,5,11,6,7,4,9,5,1])
  end
end