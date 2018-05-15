class Node
  attr_accessor :data, :connections, :visited

  def initialize
    @connections = Array.new
    @visited = false
  end
end

class Matrix
  attr_accessor :nodes

  def initialize
    @nodes = Array.new
  end

  def self.array2matrix(array)
    #takes in an NXN array and makes nodes of each and stores them as a Matrix
    n = array.length
    matrix = Matrix.new
    array.flatten.each do |value|
      node = Node.new
      node.data = value
      matrix.nodes << node
    end
    connect_matrix(matrix, n)
  end

  def self.connect_matrix(matrix, n)
    #Get the adjacent column connections
    matrix.nodes.each_with_index do |node, col|
      case col % n
      when 0
        #If I'm on the first column just add the element on the right
        node.connections.push(matrix.nodes[col + 1])
      when n - 1
        #If I'm on the last column just add the element on the left
        node.connections.push(matrix.nodes[col - 1])
      else
        #If I'm not at the border add left and right
        node.connections.push(matrix.nodes[col - 1])
        node.connections.push(matrix.nodes[col + 1])
      end
    end
    # Get the adjacent row connections by transposing the matrix
    grid = matrix.nodes.each_slice(n).to_a
    transposed_nodes = grid.transpose.flatten
    transposed_nodes.each_with_index do |node, row|
      case row % n
      when 0
        #first column connect node to the right
        node.connections.push(transposed_nodes[row + 1])
      when n - 1
        #last column connect node to the left
        node.connections.push(transposed_nodes[row - 1])
      else
        #If I'm not at the border add left and right
        node.connections.push(transposed_nodes[row - 1])
        node.connections.push(transposed_nodes[row + 1])
      end
    end
    matrix
  end

  def self.peaks_index(ar)
    #returns an array of indecies based on highest value first
    peaks = Array.new
    ar.flatten.map.with_index { |val, idx| peaks << [val, idx]}
    peaks.sort_by { |val, idx| -val }.map { |val, idx| idx }
  end

  def self.breadth_first_search(node, queue = [])
    #use node at peak index to search down non visted connections
    #add to area of peak if conn.data < node.data and node owns that conn by being the largest peak of the conn's connections
    return if node.visited #break if node has been visited and is owned by a higher peak
    node.visited = true
    $area += 1
    node.connections.each do |conn|
      if node.data > conn.data && !conn.visited #node must be higher and should not queue a previosly visited node
        queue << conn if node.data == conn.connections.map{ |conn_of_conn| conn_of_conn.data }.max #peak owens connections if node data is the larget of the connections
      end
    end
    breadth_first_search(queue.shift, queue) unless queue.empty? #seach each queued node until the queue is empty
  end
end

def greatest_peaks(try)
  #calls methods
  area_of_peak = Array.new
  my_matrix = Matrix.array2matrix(try) #create a new matrix from NXN array and connect nodes as a Matrix
  my_peaks = Matrix.peaks_index(try) #creates an array of indecies in order of highest value first
  my_peaks.each do |idx| #evaluate the area owned by each index starting from the highest peak
    $area = 0 #area owned by each peak
    Matrix.breadth_first_search(my_matrix.nodes[idx]) #search down the connections of the peak and see if it belongs to the peak
    area_of_peak << $area unless $area == 0 #nodes already owned and visited return zeros, higher peaks return the area owned by each
  end
  puts "#{area_of_peak.min} #{area_of_peak.max}"
end

tests = Array.new
tests.push([[9, 8, 5], [5, 6, 3], [8, 4, 1]])
tests.push([[8, 12], [9, 3]])
tests.push([[2, 6, 9, 11], [7, 8, 9, 8], [6, 7, 12, 9], [10, 7, 6, 4]])
tests.push([[4, 3, 2, 1], [2, 1, 0, 5], [0, 7, 4, 6], [10, 8, 4, 7]])
tests.push([[3, 6, 9, 11, 3], [5, 8, 12, 4, 6], [7, 10, 13, 2, 14], [0, 1, 5, 9, 3], [2, 8, 6, 4, 0]])

tests.each{ |arg| greatest_peaks(arg) }
