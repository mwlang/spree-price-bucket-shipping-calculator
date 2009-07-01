module Spree
  module PriceBucketShippingCalculator
    class Calculator
      def calculate_shipping(shipment)
        item_total = shipment.order.item_total
        shipping_method = shipment.shipping_method
        PriceBucketShippingRate.get_shipping_rate(item_total, shipping_method)
      end
    end
  end
end