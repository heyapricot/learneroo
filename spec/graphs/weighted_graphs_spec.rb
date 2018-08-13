require_relative "../../lib/graphs/weighted_graphs"

describe "weighted graphs" do
  let(:tests) do
    [
        [[0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0], [0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0]],
        [[0, 3, 5], [3, 0, 1], [5, 1, 0]],
        [[0, 3, 6, 0, 0, 9, 4], [3, 0, 4, 1, 0, 0, 0], [6, 4, 0, 3, 5, 4, 1], [0, 1, 3, 0, 2, 0, 0], [0, 0, 5, 2, 0, 3, 0], [9, 0, 4, 0, 3, 0, 3], [4, 0, 1, 0, 0, 3, 0]],
        [[0, 1, 1, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 1, 1, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 1, 1, 0, 0, 1, 0, 0, 0], [0, 0, 1, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0, 1, 1, 0], [0, 0, 0, 0, 0, 1, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
    ]
  end
  let(:results){["0 2 1 1 2 2", "0 1 1", "0 1 1 2 2 1 1", "0 1 1 3 2 2 3 3 4 1"]}

  let(:conns_test){[[[[0,2],1],[[0,3],3]],[[[1,3],5]],[[[2,0],1],[[2,3],2],[[2,4],1],[[2,5],4]],[[[3,0],3],[[3,1],5],[[3,2],2],[[3,4],7]],[[[4,2],1],[[4,3],7],[[4,5],2]],[[[5,2],4],[[5,4],2]]]}

  let(:wg){WeightedGraph.new}

  it "can store a node" do
    wg.add_node(3)
    expect(wg.nodes).to match_array([3])
  end

  it "stores the connection to a node and the weight" do
    wg.from_matrix(tests.first)
    expect(wg.connections).to match_array(conns_test)
  end

  it "returns the shortest path of nodes" do
    tests.each_with_index do |t,idx|
      wg = WeightedGraph.new
      wg.from_matrix(t)
      expect("0 " + wg.bfs.sort.map{|k,v| v.length - 1 }.join(" ")).to eq(results[idx])
    end
  end
end