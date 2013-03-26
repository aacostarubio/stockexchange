#!/usr/bin/env ruby

require_relative 'stock'
require_relative 'stock_exchange'
require_relative 'ticker'

stock_exchange = StockExchange.new
stocks = [ ["FB", 1], ["AMZN", 1], ["GRPN", 1] ]

ticker = Ticker.new
stock_exchange.add_observer(ticker)

stocks.each do |stock_attributes| 
  stock = Stock.new(stock_attributes[0], stock_attributes[1])
  stock.add_observer(stock_exchange)
  stock.generate_price
end

# t1=Thread.new{stock.generate_price(5)}
# t2=Thread.new{func2()}
# t1.join
# t2.join