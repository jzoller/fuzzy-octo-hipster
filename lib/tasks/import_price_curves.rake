# curve_name:string month:string open:decimal high:decimal low:decimal settle:decimal change:decimal bwave:decimal 
#vol:integer efp:integer efs:integer block:integer prev_vol:integer prev_open:integer 

require 'csv'
desc "Imports price curves from .csv's to the database"
task :import_price_curves => :environment  do 
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
				puts "in nymex 4 = #{curve[4]}, 5 = #{curve[5]}, 6 = #{curve[6]}"
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
	
