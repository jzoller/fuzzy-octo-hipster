class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :trade_id
      t.string :counter_party
      t.string :trader
      t.string :mtm_curve
      t.string :buy_sell
      t.decimal :price
      t.integer :volume
      t.string :tenor_start
      t.string :tenor_end
      t.string :delivery_location
      t.string :instrument
      t.string :brokerage
      t.string :tags
      t.string :notes

      t.timestamps
    end
  end
end
