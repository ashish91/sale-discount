require_relative 'basic_pricing_strategy.rb'

module PricingStrategy

  class PricingCalculator
    attr_reader :sold_items, :sale_price_configs, :total_price, :discount

    def initialize(items_input:, sale_price_configs:)
      self.sale_price_configs = sale_price_configs
      self.sold_items = build_sold_items(items_input)

      @pricing_strategy = BasicPricingStrategy.new(sale_price_configs: self.sale_price_configs)
    end

    def calculate_price!
      @pricing_strategy.calculate_price!(sold_items: self.sold_items)

      self.total_price = self.sold_items.values.map(&:sold_price).sum

      calculate_discount!
    end

    private
      attr_writer :sold_items, :sale_price_configs, :total_price, :discount

      def calculate_discount!
        total_price_by_units = 0
        self.sold_items.each do |_, sold_item|
          total_price_by_units += (sold_item.quantity * sold_item.item.unit_price.price)
        end
        self.discount = total_price_by_units - self.total_price
      end

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
