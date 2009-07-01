class PriceBucketShippingRate < ActiveRecord::Base
  belongs_to :shipping_method
  
  validates_presence_of :price_floor, :price_ceiling, :shipping_rate, :shipping_method

  named_scope :order_by_price_floor, :order => "price_floor"

  def self.get_shipping_rate(order_sub_total, shipping_method)
    # First try to find where price falls within price floor and ceiling
    bucket = find(:first, 
      :conditions => ["shipping_method_id = ? and ? between price_floor and price_ceiling", 
        shipping_method.id, order_sub_total])
      
    # If no bucket selected, assume price is > largest bucket defined and use last bucket
    # for the given shipping method
    bucket ||= find(:last, :conditions => ['shipping_method_id = ?', shipping_method.id])
    
    bucket.nil? ? 0.0 : bucket.shipping_rate
  end
  
  def <=>(other)
    self.price_floor <=> other.price_floor
  end
    
end
