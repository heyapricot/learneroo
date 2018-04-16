class Node

  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

end

def inOrder(num,node)
  if node.data > num
    if node.left.nil?
      node.left = Node.new(num)
    else
      inOrder(num,node.left)
    end
  elsif node.data < num
    if node.right.nil?
      node.right = Node.new(num)
    else
      inOrder(num,node.right)
    end
  end
end

def array2tree(array,head)
  array.each do |num|
    inOrder(num,head)
  end
end

myarr = [8,3,10,1,6,14,4,7,13]
head = Node.new(myarr[0])
array2tree(myarr,head)

puts head


head = Node.new(47)
inOrder(38,head)
inOrder(45,head)
inOrder(57,head)
inOrder(50,head)
