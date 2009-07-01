require File.dirname(__FILE__) + '/../spec_helper'
 

describe Spree::PriceBucketShippingCalculator::Calculator do
  before(:each) do
		@shipping_method = mock_model(ShippingMethod, :name => "Standard", :include? => true)
		
		FIRST_BUCKET_RATE = 1.0
		SECOND_BUCKET_RATE = 2.0
		THIRD_BUCKET_RATE = 3.0
    @shipping_rate1 = mock_model(PriceBucketShippingRate, 
      :price_floor => 0.0, 
      :price_ceiling => 12.0, 
      :shipping_rate => FIRST_BUCKET_RATE, 
      :shipping_method => @shipping_method)
    @shipping_rate2 = mock_model(PriceBucketShippingRate, 
      :price_floor => 12.01, 
      :price_ceiling => 25.0, 
      :shipping_rate => SECOND_BUCKET_RATE, 
      :shipping_method => @shipping_method)
    @shipping_rate3 = mock_model(PriceBucketShippingRate, 
      :price_floor => 25.01, 
      :price_ceiling => 999.0, 
      :shipping_rate => THIRD_BUCKET_RATE, 
      :shipping_method => @shipping_method)

    @product1 = mock_model(Product)
    @variant1 = mock_model(Variant, :price => 5)

		@address = mock_model(Address)
		@calculator = Spree::PriceBucketShippingCalculator::Calculator.new
  end

  it "should calculate shipping with first shipping rate" do
    @line_item1 = mock_model(LineItem, :variant => @variant1, :quantity => 1)
    @line_items = [@line_item1]
    @order = mock_model(Order, :line_items => @line_items, :item_total => 2)
		@shipment = mock_model(Shipment, :order => @order, :address => @address, :shipment_method => @shipping_method)
    
    # currently incorrect because I mocked shipping methods and there are no shipping methods in db
    # and get_shipping_rate will hit the database
    @calculator.calculate_shipping(@shipment).should == FIRST_BUCKET_RATE
  end

end
