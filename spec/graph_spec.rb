require_relative "../graphs/graph"
describe Node do
    context "when a Node is instantiated" do
      let(:node) {Node.new(0)}

      it "has a value of false for visited" do
        expect(node.visited).to be false
      end

      it "has a connections array" do
        expect(node.connections).not_to be_nil
      end
    end

end


describe Graph do

  let(:graph) {Graph.new}

  it "can add Nodes to itself" do
    NUMBER_OF_NODES = 10
    NUMBER_OF_NODES.times do |n|
      graph.add(Node.new(n))
    end
    expect(graph.nodes.length).to be NUMBER_OF_NODES
  end

  it "can get a specific node" do
    NODE_DATA = 6
    graph.add(Node.new(NODE_DATA))
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


  context "doing breadth first search" do
    it "returns an array of all node data using breadth first search" do
      ar = [[2], [4], [5, 0, 3], [2], [1, 5], [4, 2]]
      graph.fromArray(ar)
      expect(graph.bfs).to match_array([0,2,5,3,4,1])
    end

    it "keeps node.visited as false after running" do
      ar = [[2], [4], [5, 0, 3], [2], [1, 5], [4, 2]]
      graph.fromArray(ar)
      graph.bfs
      graph.nodes.values.each do |node|
        expect(node.visited).to be false
      end
    end
  end


end