require_relative "../../lib/node"

describe "when transforming a maze into a tree" do
  it "keeps the same number of elements" do
    pending "Method is not implemented"
    maze = []
    tree = mazeToTree(maze)
    expect(tree.length).to eq(maze.flatten.length)
  end
end

describe "when exploring the maze" do
  it "generates an array of coordinates that lead to the end of the maze" do
    pending "Method not implemented"
    expect(explore(maze)).to be_a(Array)
  end

  it "returns an array of coordinates that reflect the shortest path" do
    pending "Not implemented"
    mazes = Array.new
    mazes.push([[0, 0, 0, 0, 0], [0, 1, 0, 1, 0], [0, 1, 0, 1, 1], [0, 1, 0, 0, 0], [0, 0, 0, 1, 9]])
    mazes.push([[0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0], [0, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 9], [0, 1, 1, 1, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0]])
    mazes.push([[0, 0, 0], [0, 1, 9], [0, 0, 0]])
    mazes.push([[0, 0, 0, 0, 0, 1, 0, 0, 0], [0, 1, 0, 1, 0, 1, 1, 0, 1], [0, 1, 0, 1, 0, 0, 0, 0, 0], [1, 1, 0, 1, 1, 1, 0, 1, 1], [0, 0, 0, 0, 0, 1, 0, 0, 1], [1, 1, 1, 1, 0, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 1], [0, 1, 1, 0, 0, 1, 1, 0, 9], [0, 0, 1, 0, 0, 0, 0, 0, 0]])

    results = Array.new
    results.push([[0, 0],[1, 0], [2, 0], [2, 1], [2, 2], [2, 3], [3, 3], [4, 3], [4, 4]])
    results.push([[0, 0], [0, 1],[0, 2],[0, 3],[1, 3],[2, 3],[3, 3],[4, 3],[5, 3],[6, 3]])
    results.push([[0, 0],[1, 0],[2, 0],[2, 1]])
    results.push([[0, 0],[1, 0],[2, 0],[2, 1],[2, 2],[2, 3],[2, 4],[3, 4],[4, 4],[4, 5],[4, 6],[5, 6],[6, 6],[7, 6],[7, 7],[8, 7]])

    mazes.each_with_index do |maze,idx|
      expect(explore(maze)).to match_array(results[idx])
    end
  end
end