class Stock
  attr_reader :stock_price, :observers

  def initialize(symbol, refresh_time)
    @symbol = symbol
    @refresh_time = refresh_time
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer_id)
    @observers.delete_at(observer_id)		
  end

  def generate_price		
    for counter in 1..3	do
     @stock_price = rand(1..500)		
     notify
     sleep @refresh_time
    end
  end

  def notify
    observers.each do |observer|
     observer.notify(@symbol, @stock_price)
    end	
  end
end


# make a stock exchange
# third object that sits between stock and ticker
# takes stock prices and notifies of changes
# pairing
# test-drive code
# due Monday, January 28

# stock and ticker, ticker observes stock
# if we had 100 stocks, the ticker would be observing 100 stocks - problem
# adding stock exchange in between: ticker now observes 1 stock exchange, not 100 stocks