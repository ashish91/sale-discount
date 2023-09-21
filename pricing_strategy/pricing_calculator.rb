require_relative 'basic_pricing_strategy.rb'

module PricingStrategy

  class PricingCalculator
    attr_reader :sold_items, :sale_price_configs

    def initialize(items_input:, sale_price_configs:)
      self.sale_price_configs = sale_price_configs
      self.sold_items = build_sold_items(items_input)

      @pricing_strategy = BasicPricingStrategy.new(sale_price_configs: self.sale_price_configs)
    end

    def calculate_price!
      @pricing_strategy.calculate_price!(sold_items: self.sold_items)
    end

    private
      attr_writer :sold_items, :sale_price_configs

      def build_sold_items(items_input)
        sold_items = {}

        items_input.each do |sold_item|
          if sold_items.key?(sold_item)
            sold_items[sold_item].quantity += 1
          else
            sold_items[sold_item] = Models::SoldItem.new(
              item: self.sale_price_configs.items[sold_item],
              quantity: 1
            )
          end
        end

        sold_items
      end
  end

end
