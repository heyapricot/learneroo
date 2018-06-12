require_relative '../../lib/graphs/graph'
describe Graph do

  context "when a Graph is instantiated" do
    let(:graph) {Graph::Graph.new}

    it "can add Nodes to itself" do
      NUMBER_OF_NODES = 10
      NUMBER_OF_NODES.times do |n|
        graph.add(Graph::Node.new(n))
      end
      expect(graph.nodes.length).to be NUMBER_OF_NODES
    end

    it "can get a specific node" do
      NODE_DATA = 6
      graph.add(Graph::Node.new(NODE_DATA))
      expect(graph.nodes[NODE_DATA].data).to be NODE_DATA
    end


    it "can create a Graph from an array" do
      ar = [[2], [4], [5, 0, 3], [2], [1, 5], [4, 2]]
      graph.fromArray(ar)

      ar.each_with_index do |val, i|
        expect(graph.nodes[i].connections).to be val
      end
    end

    it "can get a node from it's connections property" do
      ar = [[2], [4], [5, 0, 3], [2], [1, 5], [4, 2]]
      graph.fromArray(ar)

      graph.nodes.each do |data, node|
        node.connections.each do |conn|
          expect(conn).to be graph.nodes[conn].data
        end
      end

    end

  end


  context "doing breadth first search" do

    let(:graph) {Graph::Graph.new}

    before do
      ar = [[2], [4], [5, 0, 3], [2], [1, 5], [4, 2]]
      graph.fromArray([[2], [4], [5, 0, 3], [2], [1, 5], [4, 2]])
    end

    it "returns an array of all node data using breadth first search" do
      expect(graph.bfs).to match_array([0,2,5,3,4,1])
    end

  end

  context "doing depth first search" do

    let(:graph) {Graph::Graph.new}

    before do
      ar = [[2], [4], [5, 0, 3], [2], [1, 5], [4, 2]]
      graph.fromArray([[2], [4], [5, 0, 3], [2], [1, 5], [4, 2]])
    end

    it "returns an array of all node data using depth first search" do
      expect(graph.dfs).to match_array([0,2,5,4,1,3])
    end
  end

  context "checking the graph is one connected" do

    let(:graph) {Graph::Graph.new}

    it "returns true for a one conected graph" do
      ar = [[1, 2], [0, 3, 4], [0, 5, 6], [1], [1], [2], [2]]
      graph.fromArray(ar)
      expect(graph.oneConnected?).to be true
    end

    it "returns false for a graph not one connected" do
      ar = [[1, 2], [0, 4], [0, 4], [5, 6], [1, 2, 7], [3], [3], [4]]
      graph.fromArray(ar)
      expect(graph.oneConnected?).to be false
    end

  end

  context "detecting cycles" do

    let(:graph) {Graph::Graph.new}

    it "returns true for a graph with a cycle" do
      tests = Array.new
      tests.push([[2], [4], [0, 5, 3], [5, 2], [5, 1], [4, 2, 3]])
      tests.push([[1, 2], [0, 2], [0, 1, 3, 4, 5], [2, 4], [3, 2], [2]])

      tests.each do |test|
        graph.fromArray(test)
        expect(graph.hasCycle?).to be true
        graph.nodes.clear
      end

    end

    it "returns false for a graph with no cycles" do
      tests = Array.new
      tests.push(	[[2], [2], [0, 1, 3, 4, 5], [2], [2], [2]])
      tests.push(	[[1, 2], [0, 3, 4], [0, 5, 6], [1], [1], [2], [2]])
      tests.push(	[[2], [4, 3], [0, 5], [5, 1], [1], [2, 3]])

      tests.each do |test|
        graph.fromArray(test)
        expect(graph.hasCycle?).to be false
        graph.nodes.clear
      end
    end
  end


end