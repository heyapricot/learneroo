require 'set'

def sum_pairs(array)
  k = array[0]
  numbers = array[1]
  numbers.to_set
  result = []
  numbers.each do |n|
    difference = k - n
    if numbers.include? difference
      result << [n,difference]
      numbers.delete(difference)
    end
  end
  return result
end
