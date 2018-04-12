def subset_sum(numbers, target, sum = numbers.reduce(:+))

  # if we reach the number why bother to continue
  return if sum == 0 || sum < target

  # check if the partial sum is equal to target
  return true if sum == target

  numbers.each_index do |i|
    print subset = numbers.rotate(i)[0...-1]

    subset_sum(subset, target, subset.reduce(:+))
  end
end



subset_sum([1,2,3,4,5],12)
# subset_sum([1,2,3,4,5],15)
subset_sum([1,2,3],15)