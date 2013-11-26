class CreatePriceCurves < ActiveRecord::Migration
  def change
    create_table :price_curves do |t|
      t.string :curve_name
      t.string :month
      t.decimal :open
      t.decimal :high
      t.decimal :low
      t.decimal :settle
      t.decimal :change
      t.decimal :bwave
      t.integer :vol
      t.integer :efp
      t.integer :efs
      t.integer :block
      t.integer :prev_vol
      t.integer :prev_open

      t.timestamps
    end
  end
end
