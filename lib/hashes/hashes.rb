def most_repetitions(array)
  ocurrences = Hash.new
  array.each{|n| ocurrences[n].nil? ? ocurrences[n] = 1 : ocurrences[n] += 1  }
  max_key = nil
  max_ocurrences = 1
  ocurrences.each {|k,v| max_key, max_ocurrences = k, v if v > max_ocurrences }
  return max_key
end