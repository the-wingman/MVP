class ChangePrecisionScaleOfPrices < ActiveRecord::Migration
  def change
  	change_column :gifts, :min_price, :decimal, precision: 8, scale: 2
  	change_column :gifts, :max_price, :decimal, precision: 8, scale: 2
  	change_column :gifts, :shipping_price, :decimal, precision: 8, scale: 2
  end
end
