$scores = [[13,78],[41,60],[73,28],[46,49]]

def goofspiel(array)
  matches = array.each_slice(2).map{|n| n}
  player_one_won_matches = matches.each_with_index.select{|n,idx| n[0] > n[1]}.map{|n| n[1]}
  player_two_won_matches = matches.each_with_index.select{|n,idx| n[1] > n[0]}.map{|n| n[1]}
  suit = generate_suit($scores.shift, player_one_won_matches, player_two_won_matches, matches.length)
  player_1_score = 0
  player_2_score = 0

  matches.each_with_index do |match,num|
    player_1_score += suit[num] if match[0] > match[1]
    player_2_score += suit[num] if match[1] > match[0]

  end

  return [player_1_score,player_2_score]
end

def generate_suit(scores, player_one_won_matches, player_two_won_matches, match_qty)
  suit = []
  match_qty.times{suit << nil}
  one_won_cards = rand_whose_sum_equals(scores[0], player_one_won_matches.length)
  two_won_cards = rand_whose_sum_equals(scores[1], player_two_won_matches.length)
  player_one_won_matches.each_with_index{|idx,card| suit[idx] = one_won_cards[card] }
  player_two_won_matches.each_with_index{|idx,card| suit[idx] = two_won_cards[card] }
  suit.each_with_index{|card, index| suit[index] = rand(1..13) if card.nil? }
  return suit
end

def rand_whose_sum_equals(num, qty)
  result = []
  while result.reduce(:+) != num
    ary = []
    qty.times{ ary << rand(1..13)}
    result = ary
  end
  return result
end