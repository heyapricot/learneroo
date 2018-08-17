blocks = [["B","O"],["X","K"],["D","Q"],["C","P"],["N","A"],["G","T"],["R","E"],["T","G"],["Q","D"],["F","S"],["J","W"],["H","U"],["V","I"],["A","N"],["O","B"],["E","R"],["F","S"],["L","Y"],["P","C"],["Z","M"]]

def blocks_to_hash(blocks)
  hash = Hash.new
  blocks.each do |block|
    block.each{|c| hash[c].nil? ? hash[c] = Array.new << block : hash[c] << block}
  end
  hash
end

def can_spell?(string, idx = 0, trail = [], hash = nil)
  if idx >= string.length
    return true
  else
    blocks = hash[string[idx]]
    while blocks.any?
      block = blocks.first
      remove_block(block, hash)
      return true if can_spell?(string,idx + 1, trail.dup << block, hash)
    end
  end
  false
end

def remove_block(block, hash)
  block.each{|c| hash[c].delete_at(hash[c].index(block) || hash[c].length) }
end
