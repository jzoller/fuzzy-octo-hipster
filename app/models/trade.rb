class Trade < ActiveRecord::Base
  attr_accessible :brokerage, :buy_sell, :counter_party, :delivery_location, :instrument, :mtm_curve, :notes, :price, :tags, :tenor_end, :tenor_start, :trade_id, :trader, :volume
end
