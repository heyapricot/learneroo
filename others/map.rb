class Map
  attr_accessor :nodes

  def initialize
    @nodes = Array.new
  end

  def add(node)
    @nodes.push(node)
  end

  def fromArray(ar)
    ar.each_with_index do |row, row_idx|
      row.each_with_index do |elem, col_idx|
        add(Node.new(elem,makeConnections(row_idx,col_idx,ar)))
      end
    end
  end

  private

  def makeConnections(row_idx, col_idx, ar)
    conns = Array.new
    last_col = (ar[row_idx].length - 1)
    last_row = (ar.length - 1)
    #Detect first element of row
    if col_idx == 0
      conns.push(ar[row_idx][1])
    elsif col_idx == last_col
      conns.push(ar[row_idx][last_col - 1])
    else
      conns.push(ar[row_idx][col_idx - 1])
      conns.push(ar[row_idx][col_idx + 1])
    end
    # Detect last element of row

    if row_idx == 0
      conns.push(ar[row_idx + 1][col_idx])
    elsif row_idx == last_row
      conns.push(ar[row_idx - 1][col_idx])
    else
      conns.push(ar[row_idx - 1][col_idx])
      conns.push(ar[row_idx + 1][col_idx])
    end


    conns
  end

end