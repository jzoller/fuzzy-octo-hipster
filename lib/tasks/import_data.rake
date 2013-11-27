require 'csv'
desc "Imports trades.csv into trades table"
task :import_trades => :environment do
	CSV.foreach("db/data/trades.csv", :headers => true) do |trade|
		#Trade.create!(trade.to_hash)  #this line is not allowed due to mass assignment issues; revisit this issue if time permits
		Trade.create!(
			:trade_id => trade[0],
			:counter_party => trade[1],
			:trader => trade[2],
			:mtm_curve => trade[3],
			:buy_sell => trade[4],
			:price  => trade[5],
			:volume => trade[6],
			:tenor_start => trade[7],
			:tenor_end => trade[8],
			:delivery_location => trade[9],
			:instrument => trade[10],
			:brokerage => trade[11],
			:tags => trade[12],
			:notes => trade[13] 
			)
	end
end
