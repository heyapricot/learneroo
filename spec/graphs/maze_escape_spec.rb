require_relative "../../lib/maze"

describe "Maze class methods" do
  let(:maze){Maze.new}

  it "can retrieve a node by specifying coordinates" do
    maze.fromArray([[0,0],[1,1]])
    expect(maze.cells[[0,0]]).to be_a(Node)
    expect(maze.cells[[0,0]].coordinates).to match_array([0,0])
  end
end


context "Creating a Maze from an array" do
  let(:maze) { Maze.new([[0, 0, 0, 0, 0], [0, 1, 0, 1, 0], [0, 1, 0, 1, 1], [0, 1, 0, 0, 0], [0, 0, 0, 1, 9]]) }

  it "keeps the same number of elements" do
    expect(maze.cells.keys.length).to eq(25)
  end

  it "keeps the connections" do
    expect(maze.cells[[0,0]].connections.length).to eq(2)
    expect(maze.cells[[4,4]].connections.length).to eq(0)
    expect(maze.cells[[0,0]].connections[0].coordinates).to match_array([1,0])
    expect(maze.cells[[0,0]].connections[1].coordinates).to match_array([0,1])
  end
end

describe "when exploring the maze" do
  let(:maze) { Maze.new([[0, 0, 0, 0, 0], [0, 1, 0, 1, 0], [0, 1, 0, 1, 1], [0, 1, 0, 0, 0], [0, 0, 0, 1, 9]]) }

  it "generates an array of coordinates that lead to the end of the maze" do
    expect(maze.explore).to be_a(Array)
  end

  it "returns an array of coordinates that reflect the shortest path" do
    mazes = Array.new
    mazes.push(Maze.new([[0, 0, 0, 0, 0], [0, 1, 0, 1, 0], [0, 1, 0, 1, 1], [0, 1, 0, 0, 0], [0, 0, 0, 1, 9]]))
    mazes.push(Maze.new([[0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0], [0, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 9], [0, 1, 1, 1, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0]]))
    mazes.push(Maze.new([[0, 0, 0], [0, 1, 9], [0, 0, 0]]))
    mazes.push(Maze.new([[0, 0, 0, 0, 0, 1, 0, 0, 0], [0, 1, 0, 1, 0, 1, 1, 0, 1], [0, 1, 0, 1, 0, 0, 0, 0, 0], [1, 1, 0, 1, 1, 1, 0, 1, 1], [0, 0, 0, 0, 0, 1, 0, 0, 1], [1, 1, 1, 1, 0, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 1], [0, 1, 1, 0, 0, 1, 1, 0, 9], [0, 0, 1, 0, 0, 0, 0, 0, 0]]))

    results = Array.new
    results.push([[0, 0],[1, 0], [2, 0], [2, 1], [2, 2], [2, 3], [3, 3], [4, 3], [4, 4]])
    results.push([[0, 0], [0, 1],[0, 2],[0, 3],[1, 3],[2, 3],[3, 3],[4, 3],[5, 3],[6, 3]])
    results.push([[0, 0],[1, 0],[2, 0],[2, 1]])
    results.push([[0, 0],[1, 0],[2, 0],[2, 1],[2, 2],[2, 3],[2, 4],[3, 4],[4, 4],[4, 5],[4, 6],[5, 6],[6, 6],[7, 6],[7, 7],[8, 7]])

    mazes.each_with_index do |maze,idx|
      maze.explore
      expect(maze.shortest).to match_array(results[idx])
    end
  end
end