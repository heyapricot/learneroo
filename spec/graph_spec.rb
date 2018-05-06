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
  context "when a Graph is instantiated" do
    let(:graph) {Graph.new}

  end

  it "can add Nodes to itself" do
    graph = Graph.new
    graph.addNode(Node.new(1))
    expect(graph.getNode(1).data).to be 1
  end

  it "can get a specific node" do


  end

  it "can create a Graph from an array" do

  end


  it "can traverse nodes using breadth first search" do

  end
end