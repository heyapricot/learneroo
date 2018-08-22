$coins = [1,2,3]

def count_change(target, coins, coin_position = coins.length - 1)
  return 0 if target < 0 or coin_position < 0
  return 1 if target == 0
  return count_change(target, coins, coin_position - 1) + count_change(target - coins[coin_position], coins, coin_position)
end