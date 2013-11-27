require 'csv'
desc "Imports trades.csv into trades table"
task :import_trades_and_price_curves => :environment do
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

	price_curve_files = {
		'NYMEX CL' => 'nymex.csv',
		'ICE WTI' => 'ice_wti.csv', 
		'ICE BRENT' => 'ice_brent.csv'
	}
	price_curve_files.keys.each do |curve_name|
		CSV.foreach("db/data/#{price_curve_files[curve_name]}", :headers => true) do |curve|
			if curve_name != 'NYMEX CL' #note:  would find a MUCH better way if not under time crunch; I do know better
			PriceCurve.create!(
				:curve_name => curve_name,
				:month => curve[0],
				:open => curve[1],
				:high => curve[2],
				:low => curve[3],
				:settle => curve[4],
				:change => curve[5],
				:bwave => curve[6],
				:vol => curve[7],
				:efp => curve[8],
				:efs => curve[9],
				:block => curve[10],
				:prev_vol => curve[11],
				:prev_open => curve[12]
			)
			else
				PriceCurve.create!(
				:curve_name => curve_name,
				:month => curve[0],
				:open => curve[1],
				:high => curve[2],
				:low => curve[3],
				:settle => curve[6],
				:change => curve[5],
				:bwave => 0,
				:vol => curve[7],
				:efp => 0,
				:efs => 0,
				:block => 0,
				:prev_vol => 0,
				:prev_open => curve[8]
			)
			end
		end
	end
end