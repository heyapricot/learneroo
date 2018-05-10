require_relative "../others/map"
require_relative "../graphs/graph"

context "creating a graph from a 'matrix'" do
  let(:my_map) { Map.new }

  tests = Array.new

  tests.push([[9, 8, 5], [5, 6, 3], [8, 4, 1]])
  tests.push(	[[8, 12], [9, 3]])
  tests.push(	[[2, 6, 9, 11], [7, 8, 9, 8], [6, 7, 12, 9], [10, 7, 6, 4]])
  tests.push(	[[4, 3, 2, 1], [2, 1, 0, 5], [0, 7, 4, 6], [10, 8, 4, 7]])
  tests.push(	[[3, 6, 9, 11, 3], [5, 8, 12, 4, 6], [7, 10, 13, 2, 14], [0, 1, 5, 9, 3], [2, 8, 6, 4, 0]])

  it "converts every element into a Node" do

    tests.each do |test|
      my_map.nodes.clear
      my_map.fromArray(test)
      expect(my_map.nodes.length).to eq(test.flatten.length)
    end

    #Check if the graph has the same number of nodes as the test array
  end

  it "saves the connections with the adjacent numbers" do
    my_map.fromArray(tests[2])
    expect(my_map.nodes[0].connections.map{|node| node.data}).to match_array([6,7])
    expect(my_map.nodes[1].connections.map{|node| node.data}).to match_array([2,9,8])
    expect(my_map.nodes[5].connections.map{|node| node.data}).to match_array([7,9,6,7])
  end

  it "gets a node using data as input" do

  end
end

context "finding the peaks" do

  it "tells if a node is peak" do

  end


  pending "returns an array of values higher than their connections" do
    tests = Array.new
    peaks = Array.new

    tests.push([[9, 8, 5], [5, 6, 3], [8, 4, 1]])
    tests.push([[8, 12], [9, 3]])
    tests.push([[2, 6, 9, 11], [7, 8, 9, 8], [6, 7, 12, 9], [10, 7, 6, 4]])
    tests.push([[4, 3, 2, 1], [2, 1, 0, 5], [0, 7, 4, 6], [10, 8, 4, 7]])
    tests.push([[3, 6, 9, 11, 3], [5, 8, 12, 4, 6], [7, 10, 13, 2, 14], [0, 1, 5, 9, 3], [2, 8, 6, 4, 0]])

    #Be very careful with the order of tests and results
    #results contains the smallest and largest area around a peak

    peaks.push([9,8])
    peaks.push([12,9])
    peaks.push([12,11,10])
    peaks.push([10,7,4])
    peaks.push([14,13,8])

    tests.each_with_index do |test,idx|
      graph = Graph.new
      graph.fromArray(test)
      expect(graph.get_peaks.sort.reverse).to match_array(results[idx])
    end

  end
end


context "finding the peaks of highest area" do
  pending "returns the two peaks with highest area" do
    graph = Graph.new

    tests = Array.new
    results = Array.new

    tests.push([[9, 8, 5], [5, 6, 3], [8, 4, 1]])
    tests.push(	[[8, 12], [9, 3]])
    tests.push(	[[2, 6, 9, 11], [7, 8, 9, 8], [6, 7, 12, 9], [10, 7, 6, 4]])
    tests.push(	[[4, 3, 2, 1], [2, 1, 0, 5], [0, 7, 4, 6], [10, 8, 4, 7]])
    tests.push(	[[3, 6, 9, 11, 3], [5, 8, 12, 4, 6], [7, 10, 13, 2, 14], [0, 1, 5, 9, 3], [2, 8, 6, 4, 0]])

    #Be very careful with the order of tests and results
    #results contains the smallest and largest area around a peak

    results.push([3,6])
    results.push([1,3])
    results.push([3,9])
    results.push([4,7])
    results.push([2,13])

    expect(graph.highest_peaks).to match_array
  end
end
