require_relative "../lib/prime_primes"


tests = Array.new
tests.push(	[2, 3, 5, 6, 9])
tests.push([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])
tests.push([7, 6, 7, 3, 77, 14, 28, 35, 42])
tests

results = [3,11,7]

describe "get_primes" do

  it "gets the prime numbers in the input array" do
    expect(get_primes(tests[0])).to match_array([2,3,5])
  end
end

describe "get_prime_primes" do

  it "gets the prime number that repeats the most" do
    tests.each_with_index do |test,idx|
      expect(get_prime_primes(test)).to eq(results[idx])
    end
  end
end