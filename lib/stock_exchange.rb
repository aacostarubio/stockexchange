class StockExchange
  attr_reader :observers, :stock_price

  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer_id)
    @observers.delete_at(observer_id)
  end

  def notify(symbol, stock_price)
    @observers.each { |observer| observer.notify(symbol, stock_price) }
  end

end