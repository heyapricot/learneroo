require 'set'
def find_duplicates(array)
  output = array.dup
  output.to_set.each{|n| output.delete_at(output.index(n))}
  return output
end