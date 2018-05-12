class Node
  attr_accessor :area, :index, :data, :connections, :visited, :queued

  def initialize
    @area = 0
    @connections = Array.new
    @visited = false
    @queued = false
  end
end

class Matrix
  attr_accessor :nodes

  def initialize
    @nodes = Array.new
  end
end

def array2matrix(array)
  #takes in an NXN array and makes nodes of each and stores them as a Matrix
  matrix = Matrix.new
  n = array.length

  array.flatten.each_with_index do |value, idx|
    node = Node.new
    node.data = value
    node.index = idx
    matrix.nodes.push(node)
  end
  connect_matrix(matrix, n)
end

def connect_matrix(matrix, n)
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
  # Get the adjacent row connections
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

def peaks_index(ar)
  #returns an array of indecies based on highest value first
  peaks = Array.new
  ar.flatten.map.with_index { |val, idx| peaks << [val, idx]}
  peaks.sort_by { |val, idx| val }.reverse.map { |val, idx| idx }
end

def breadth_first_search(node, queue = [])
  #use peaks_index[0] to search down non visted conns
  #count if conn.data < node.data and node owns that conn because another peak isnt larger than node
  #return count
  return if node.visited
  node.visited = true
  $count += 1
  node.connections.each do |conn|
    if node.data > conn.data && !conn.visited && !conn.queued
      if node.data > conn.connections.map{|conn_of_conn| !conn_of_conn.visited ? conn_of_conn.data : 0}.max
        queue << conn
        conn.queued = true
      end
    end
  end
  breadth_first_search(queue.shift, queue) unless queue.empty?
end

def greatest_peaks(a)
  #calls methods
  count = []
  my_matrix = array2matrix(a)
  my_peaks = peaks_index(a)
  my_peaks.each do |idx|
    $count = 0
    breadth_first_search(my_matrix.nodes[idx])
    count << $count unless $count == 0
  end
  puts "#{count.min} #{count.max}"
end

tests = Array.new
tests.push([[9, 8, 5], [5, 6, 3], [8, 4, 1]])
tests.push([[8, 12], [9, 3]])
tests.push([[2, 6, 9, 11], [7, 8, 9, 8], [6, 7, 12, 9], [10, 7, 6, 4]])
tests.push([[4, 3, 2, 1], [2, 1, 0, 5], [0, 7, 4, 6], [10, 8, 4, 7]])
tests.push([[3, 6, 9, 11, 3], [5, 8, 12, 4, 6], [7, 10, 13, 2, 14], [0, 1, 5, 9, 3], [2, 8, 6, 4, 0]])

tests.each{ |arg| greatest_peaks(arg) }
