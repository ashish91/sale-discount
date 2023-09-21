require 'yaml'
require 'pry'


module Parser

  class SalePriceParser
    attr_reader :currency, :items

    def initialize
      @config = YAML.safe_load(File.read(Dir.pwd + '/configs/sale_price.yml'), symbolize_names: true)

      self.currency = @config[:currency]
      self.items = parse_config(@config)
    end

    private
      attr_writer :currency, :items

      def parse_config(config)
        init_items(@config[:items])
      end

      def init_items(items_hash)
        items = {}

        items_hash.map do |item_name, attrs|
          item = Models::Item.new(name: item_name)

          unit_price = Models::UnitPrice.new(
            price: attrs[:unit_price][:price],
            currency: self.currency
          )
          item.unit_price = unit_price

          if attrs.key?(:sale_price)
            sale_price = Models::SalePrice.new(
              units: attrs[:sale_price][:units],
              price: attrs[:sale_price][:price]
            )
            item.sale_price = sale_price
          end

          items[item_name] = item
        end

        items
      end

  end

end
