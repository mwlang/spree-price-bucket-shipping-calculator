require File.dirname(__FILE__) + '/../spec_helper'

describe PriceBucketShippingRate do
  before(:each) do
    @shipping_rate = PriceBucketShippingRate.new
    @shipping_method = ShippingMethod.new
  end

  it "should have a get_shipping_rate method" do
    PriceBucketShippingRate.get_shipping_rate(5, @shipping_method).should == 0.0
  end
  
  ['price floor', 'price ceiling', 'shipping rate'].each do |field|
    it "should require #{field}" do
      @shipping_rate.valid?.should be_false
      @shipping_rate.errors.full_messages.should include("#{field.capitalize} can't be blank")
    end
  end

end
