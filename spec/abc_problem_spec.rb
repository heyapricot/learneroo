require_relative '../lib/abc_problem'
describe "can_spell?" do
  let(:tests){["A", "BBB", "BARK", "BOOK", "TREAT", "COMMON", "CONFUSE"]}
  let(:results){[true,false,true,false,true,false,true]}

  it "returns true if the word can be spelled with the blocks and false otherwise" do
    blocks = [["B","O"],["X","K"],["D","Q"],["C","P"],["N","A"],["G","T"],["R","E"],["T","G"],["Q","D"],["F","S"],["J","W"],["H","U"],["V","I"],["A","N"],["O","B"],["E","R"],["F","S"],["L","Y"],["P","C"],["Z","M"]]
    tests.each_with_index do |t,idx|
      expect(can_spell?(t,0,[],blocks_to_hash(blocks))).to be results[idx]
    end
  end
end