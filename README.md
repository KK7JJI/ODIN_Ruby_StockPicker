# TOP - Project Stock Picker
## Requirements
The method accepts an array of stock prices, each array element represents a day.
It returns an array containing indecies of those stock price array representing which day was the
best day to purchase the stock and which day was the best day to sell the stock.

- If the stock price array length is < 2 then return an empty array.
- If the stock prices decend daily then return an empty array.
- The maximum spread may not start with the minimum price. Locate the pair of prices
  in the dataset such that the difference between purchase and sale prices are maximized
  subject to the constraints given.
- Profit should be taken over the shortest range of days.
- Profit should be taken as early as possible.

## Constraint
- A stock much be purchased on a day before it can be sold.
-

examples:
```
irb(main):001> load "./stockpicker.rb"
irb(main):002> stock_prices = [17,3,6,9,15,8,6,1,10]
irb(main):003> stockpicker(stock_prices)
=>
[1,4]
```

```
irb(main):001> load "./stockpicker.rb"
irb(main):002> stock_prices = [3,5,3,5,3,5]
irb(main):003> stockpicker(stock_prices)
=>
[0,1]
```

```
irb(main):001> load "./stockpicker.rb"
irb(main):002> stock_prices = [3,4,5,3,4,10]
irb(main):003> stockpicker(stock_prices)
=>
[3,5]
```

```
irb(main):001> load "./stockpicker.rb"
irb(main):002> stock_prices = [5,3,5]
irb(main):003> stockpicker(stock_prices)
=>
[1,2]
```

```
irb(main):001> load "./stockpicker.rb"
irb(main):002> stock_prices = [20,19,18,17,16,15,14]
irb(main):003> stockpicker(stock_prices)
=>
[]
```

```
irb(main):001> load "./stockpicker.rb"
irb(main):002> stock_prices = [20]
irb(main):003> stockpicker(stock_prices)
=>
[]
```

```
irb(main):001> load "./stockpicker.rb"
irb(main):002> stock_prices = [5,5,5,5]
irb(main):003> stockpicker(stock_prices)
=>
[]
```