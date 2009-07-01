Price Bucket Shipping Rate
==========================
**Supports Spree >= 0.8.x**

The Price Bucket Shipping Rate Calculator allows you to define shipping costs based on the order's sub-total
and shipping method.

When installed, a new "Price Bucket Shipping Rates" link is added to the Configuration area in the Spree administration interface. Here you can define as many different rates as required, and link them to the relevant Shipping Methods

Each PriceBucketShippingRate contains the following values:

1. **Shipping Method:** Each PriceBucketShippingRate is associated with a _Shipping Method_, which is used to link products to particular rates. 

2. **Price Floor:** This is the lower end of the price range for defining the "price bucket".  The value is inclusive.

3. **Price Ceiling:** This is the upper end of the price range for defining the "price bucket"   The value is inclusive.

4. **Shipping Rate:** Is the shipping charge to apply to the order for order's whose sub-totals fall within this price bucket.


Examples
========
The sample data contained with this extension shows how to configure Spree to support multiple PriceBucketShippingRates broken down by three different _Shipping Methods_.

       Shipping Method              Price Floor       Price Ceiling        Shipping Rate               -------------------------------------------------------------------------------------------
       Standard Shipping            $   0.00           $  15.00             $  4.00
       Standard Shipping            $  15.01           $  35.00             $  8.00
       Standard Shipping            $  35.01           $ 100.00             $ 16.00
       Standard Shipping            $ 100.01           $ 999.00             $  0.00

       Express Shipping             $  0.00            $  15.00             $  8.00
       Express Shipping             $ 15.01            $  35.00             $ 16.00
       Express Shipping             $ 35.01            $ 999.00             $ 32.00
       Express Shipping            $ 100.01            $ 999.00             $ 16.00


Quick Start
===========
1. Install extension:

    `script/extension install git://github.com/mwlang/spree-price-bucket-shipping-rate.git `

2. Migrate the database (or bootstrap if you want the sample data for testing)

    `rake db:migrate`
