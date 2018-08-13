require_relative "../../lib/graphs/weighted_graphs"

describe "dijkstra" do
  let(:tests) do
    [
        [[0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0], [0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0]],
        [[0, 3, 5], [3, 0, 1], [5, 1, 0]],
        [[0, 3, 6, 0, 0, 10], [3, 0, 4, 1, 0, 0], [6, 4, 0, 3, 5, 4], [0, 1, 3, 0, 2, 0], [0, 0, 5, 2, 0, 3], [10, 0, 4, 0, 3, 0]],
        [[0, 3, 6, 0, 0, 9, 4], [3, 0, 4, 1, 0, 0, 0], [6, 4, 0, 3, 5, 4, 1], [0, 1, 3, 0, 2, 0, 0], [0, 0, 5, 2, 0, 3, 0], [9, 0, 4, 0, 3, 0, 3], [4, 0, 1, 0, 0, 3, 0]]
    ]
  end

  let(:results) do
    [
        "0 8 1 3 2 4", "0 3 4", "0 3 6 4 6 9", "0 3 5 4 6 7 4"
    ]
  end

  it "finds the shortest path" do
    tests.each_with_index do |t,idx|
      wg = WeightedGraph.new
      wg.from_matrix(t)
      expect(wg.dijkstra.sort_by{|k,v| k.id }.map{|k,v| v}.join(" ")).to eq(results[idx])
    end
  end
end