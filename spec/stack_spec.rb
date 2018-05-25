require_relative "../lib/stack/stack"

describe "stack" do

  before(:each) do
    @stack = Stack::Stack.new
  end

  it "pushes an element to the top of the stack"
  it "pops an element from the top of the stack" do
    num = 3
    @stack.push(num)
    expect(@stack.pop).to eq(num)
  end
end