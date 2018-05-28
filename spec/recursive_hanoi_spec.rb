require_relative "../lib/recursion/hanoi"

describe "recursive_hanoi" do
  it "delivers an array of pairs that represent the discs movement" do
    expect(recursive_hanoi(3)).to match_array([[1,3],[1,2],[3,2],[1,3],[2,1],[2,3],[1,3]])
    expect(recursive_hanoi(4)).to match_array([[1,2],[1,3],[2,3],[1,2],[3,1],[3,2],[1,2],[1,3],[2,3],[2,1],[3,1],[2,3],[1,2],[1,3],[2,3]])
  end
end