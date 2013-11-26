class PriceCurve < ActiveRecord::Base
  attr_accessible :block, :bwave, :change, :curve_name, :efp, :efs, :high, :low, :month, :open, :prev_open, :prev_vol, :settle, :vol
end
