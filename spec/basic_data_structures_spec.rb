require_relative "../lib/basic_data_structures"

describe "stack" do

  before(:each) do
    @stack = DataStructures::Stack.new
    @queue = DataStructures::Queue.new
  end

  it "pushes and pops an element from the top of the stack" do
    num = 7
    (0..num).each do |n|
      @stack.push(n)
    end

    (0..num).reverse_each do |n|
      expect(@stack.pop).to eq(n)
    end

  end

  it "pushes an element to the end of the list and pops it from the beginning" do
    num = 7
    (0..num).each do |n|
      @queue.push(n)
    end

    (0..num).each do |n|
      expect(@queue.dequeue).to eq(n)
    end
  end
end