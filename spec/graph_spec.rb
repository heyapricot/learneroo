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
      graph.addNode(Node.new(n))
    end
    expect(graph.nodes.length).to be NUMBER_OF_NODES
  end

  it "can get a specific node" do


  end

  it "can create a Graph from an array" do

  end


  it "can traverse nodes using breadth first search" do

  end
end