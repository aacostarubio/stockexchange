require 'stock'
require 'stock_exchange'

describe Stock do
	before(:all) do
		@stock_exchange = StockExchange.new
		@stock = Stock.new("IBM", 1)
  	end
	
	it "adds observers" do
		@stock.add_observer("string")
		@stock.observers.should == ["string"]
	end

	it "removes observers" do
		@stock.remove_observer(0)
		@stock.observers.should == []
	end

	it "generates a stock price" do
		@stock.generate_price
		@stock.stock_price.should be_a_kind_of(Fixnum)
	end

	it "notifies observers" do
		observer = mock('observer')
		@stock.add_observer(observer)
		observer.should_receive(:notify).with(instance_of(String), instance_of(Fixnum))	
		@stock.notify
	end
		
end