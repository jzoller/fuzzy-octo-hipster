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
		puts "importing #{curve_name}"
		CSV.foreach("db/data/#{price_curve_files[curve_name]}", :headers => true) do |curve|
			puts 'reading entry'
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
			puts 'new entry read'
		end
	end
end
	
