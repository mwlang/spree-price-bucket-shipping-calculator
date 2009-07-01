# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PriceBucketShippingCalculatorExtension < Spree::Extension
  version "0.8.2"
  description "Calculates shipping by price range buckets based on order sub-totals"
  url "http://github.com/mwlang/spree-price-bucket-shipping-rates/tree/master"
 
  define_routes do |map|
    map.namespace :admin do |admin|
      admin.resources :price_bucket_shipping_rates
    end  
  end
  
  def activate
    Admin::ConfigurationsController.class_eval do
      before_filter :add_price_bucket_shipping_rate_links, :only => :index
      def add_price_bucket_shipping_rate_links
        @extension_links << {:link => admin_price_bucket_shipping_rates_path, 
            :link_text => PriceBucketShippingRate.human_name(:count => 2), 
            :description => t('price_bucket_shipping_rates_description')}
      end
    end
  end
end