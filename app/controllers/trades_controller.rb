#.where(:curve_name => trade.mtm_curve)
class TradesController < ApplicationController
  def index
  	@buy_sell_strings = {'B' => 'Buy', 'S' => 'Sell'}
  	@portfolio_total = 0
  	Trade.all.each do |mtm_value|
  		@portfolio_total += get_mtm_value_for_trade(mtm_value.trade_id).round(2)
  	end
  end

  def get_mtm_value_for_trade(trade_id)
  	trade = Trade.find(trade_id)
 	current_curve = PriceCurve.where(:curve_name => trade.mtm_curve)
	compute_mtm_value(current_curve, trade)
  end

  def compute_mtm_value(curve_data, trade)
 
  	current_id = curve_data.find(find_id_of_month(curve_data, trade.tenor_start.to_s.downcase.gsub(/[- ]/, ''))).id
  	tenor_end_id = curve_data.find(find_id_of_month(curve_data, trade.tenor_end.to_s.downcase.gsub(/[- ]/, ''))).id
  	mtm_value = 0
  	#puts "current_id = #{current_id}  tenor_end_id = #{tenor_end_id}"
  	while current_id <= tenor_end_id
  		mtm_value += trade.volume * (trade.price - curve_data.find(current_id)[:settle])
  		current_id += 1
  	end
  	mtm_value
  end

  def find_id_of_month(curve_data, target_month)
  	curve_data.each do |entry|
  		if entry[:month].to_s.downcase.gsub(/[- ]/, '') == target_month
  		#	puts "#{entry.id} = entry.id"
  			return entry.id
  		end
  	end
  end

  def always_returns_true
  	true
  end
end
