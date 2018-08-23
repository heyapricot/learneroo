def equilibrium_index(array)
  left_sum = 0
  right_sum = array[1..-1].reduce(:+)
  indexes = []
  (1..array.length - 1).each do |idx|
    left_sum += array[idx - 1]
    right_sum -= array[idx]
    indexes << idx if left_sum == right_sum
  end
  indexes
end