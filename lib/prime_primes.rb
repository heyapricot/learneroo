def get_primes(ar)
  primes = []

  ar.each do |num|
    primes << num if num == 2
    primes << num if (2..num-1).all?{ |div| num % div != 0 } unless num == 2
  end

  primes
end

def get_prime_primes(ar)
  ocurrences = Hash.new(0)
  primes = get_primes(ar)
  primes.each do |p|
    ar.each do |n|
      if n % p == 0
        if ocurrences.key?(p)
          ocurrences[p] += 1
        else
          ocurrences[p] = 1
        end
      end
    end
  end

  ocurrences.key(ocurrences.values.max)

end