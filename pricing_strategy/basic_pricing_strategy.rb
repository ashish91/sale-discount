module PricingStrategy

  class BasicPricingStrategy
    def initialize(sale_price_configs:)
      @sale_price_configs = sale_price_configs
    end

    def calculate_price!(sold_items:)
      sold_items.each do |item_name, sold_item|
        item_config = @sale_price_configs.items[item_name]

        if item_config.sale_price.nil?
          sold_price = sold_item.quantity * item_config.unit_price.price
        else
          sold_price = discounted_price(
            quantity: sold_item.quantity,
            unit_price: sold_item.item.unit_price.price,
            sale_price: item_config.sale_price
          )
        end

        sold_item.sold_price = sold_price
      end
    end

    private
      def discounted_price(quantity:, unit_price:, sale_price:)
        (quantity/sale_price.units)*sale_price.price + (quantity%sale_price.units)*unit_price
      end
  end

end
