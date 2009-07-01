class CreatePriceBucketShippingRates < ActiveRecord::Migration
  def self.up
    create_table :price_bucket_shipping_rates do |t|
      t.references :shipping_method
	    t.decimal :price_floor, :precision => 8, :scale => 2
	    t.decimal :price_ceiling, :precision => 8, :scale => 2
      t.decimal :shipping_rate, :precision => 8, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :price_bucket_shipping_rates
  end
end
