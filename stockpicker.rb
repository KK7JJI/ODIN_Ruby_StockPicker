def stockpicker(stock_prices)

  if stock_prices.length < 2
    buy_sell_days = []
  elsif descending?(stock_prices)
    buy_sell_days = []
  else

    valid_price_combos = get_valid_price_combinations(stock_prices)
    best_prices = get_best_buy_sell_prices(valid_price_combos)
    buy_sell_days = get_buy_sell_days(best_prices, stock_prices)

  end
  print_results(stock_prices, buy_sell_days)
  buy_sell_days

end

def get_valid_price_combinations(stock_prices)

  stock_prices.combination(2).filter { |left, right| left <= right }

end

def get_best_buy_sell_prices(valid_price_combos)

  #returns array = [buy price, sell price]
  valid_price_combos.reduce([0,0]) do |best_prices, prices|
    profit = prices[1] - prices[0]
    if (best_prices[1]-best_prices[0]) < profit
      best_prices = prices
    end
    best_prices
  end

end

def get_buy_sell_days(best_prices, stock_prices)
  #returns array = [buy day index, sell day index]

  buy_days = get_stock_price_indicies(stock_prices, best_prices[0])
  sell_days = get_stock_price_indicies(stock_prices, best_prices[1])

  buy_sell_pairs = buy_days.product(sell_days).filter \
    {|left, right| right > left}

  quickest_profit = buy_sell_pairs.reduce([0,0]) do |quickest_profit, days|
    range = days[1] - days[0]
    if quickest_profit == [0,0]
      quickest_profit = days
    elsif range < quickest_profit[1]-quickest_profit[0]
      quickest_profit = days
    end
    quickest_profit
  end

  quickest_profit

end

def get_stock_price_indicies(stock_prices, price)

  days = stock_prices.each_index.select \
    {|idx| stock_prices[idx] == price}
  days

end

def descending?(stock_prices)
  stock_prices.each_cons(2).all? {|left, right| right - left <= 0}
end

def print_results(stock_prices, buy_sell_days)

  puts ""
  puts "  Daily Prices: #{stock_prices}"
  puts "="*80

  if buy_sell_days == []
    puts "There was no winning move."
    puts ""
  else
    puts "   Buy on: #{buy_sell_days[0]} at #{stock_prices[buy_sell_days[0]]}"
    puts "  Sell on: #{buy_sell_days[1]} at #{stock_prices[buy_sell_days[1]]}"
    puts "   Profit: #{stock_prices[buy_sell_days[1]] - stock_prices[buy_sell_days[0]]}"
    puts "="*80
    puts ""
  end

end