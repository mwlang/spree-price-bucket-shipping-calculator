class Admin::PriceBucketShippingRatesController < Admin::BaseController    
    resource_controller
    before_filter :load_data
    layout 'admin'

    update.response do |wants|
      wants.html { redirect_to collection_url }
    end

    create.response do |wants|
      wants.html { redirect_to collection_url }
    end
    
    private 
			def collection 
	      @collection ||= end_of_association_chain.order_by_price_floor
	    end
	
	    def load_data     
	      @available_shipping_methods = ShippingMethod.find :all, :order => :name
	    end
end
