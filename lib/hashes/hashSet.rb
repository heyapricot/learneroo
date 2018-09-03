require 'set'

def sieve_of_eratosthenes(n)
  numbers = (2..n).to_a
  numbers.each{|n| numbers.select!{|k| k <= n or k % n != 0}}
  return numbers.to_set
end

def primes_in(array)
  primes = sieve_of_eratosthenes(array.max)
  return array.select{|n| primes === n }
end