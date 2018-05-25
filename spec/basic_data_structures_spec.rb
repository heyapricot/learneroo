require_relative "../lib/basic_data_structures"

describe "stack" do

  before(:each) do
    @stack = DataStructures::Stack.new
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
end