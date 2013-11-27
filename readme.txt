Glowing Cyril Interview

to run:

1. $ rake db:migrate
sets up the database with trades and price_curve tables

2. $ rake import_trades_and_price_curves
populates data from the .csv files in db/data

3. $ rails s
runs rails server

The trades page will come up on localhost:3000

The bulk of the code is in the trades_controller.rb, and associated view.  In the view, I just have a basic table, and a .all.each loop going through each of the trades and displaying them in the table.

In the controller, the calculation for an individual MTM curve is returned by get_mtm_value_for_trade.  The bulk of the calculation was moved to compute_mtm_value, since keeping it in one method was making the code messy, and hard to follow.  For the same reason, I made find_id_of_month to return the value of the id for the given month (used on the tenor_start and tenor_end of each trade). 

It is worth noting that I was not able to take a more test driven approach that I prefer when developing, since I was having difficulties getting rspec to recognize the class that it was supposed to test.  I attribute this to the fact that I have only used ruby sparingly, and had not used rails to this point.  Still, I am glad I did so, instead of opting to use javascript, since I learned much about ruby and rails in the process, and I intend to learn much more.  All in all, this turned out pretty decently for a first rails application. I hope to hear back from you soon!
