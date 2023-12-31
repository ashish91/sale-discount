module Io

  class OutputFormatter
    class << self
      ROUNDING_PRICES = 2.freeze

      def please_enter_text
        puts "Please enter all the items purchased separated by a comma"
      end

      def price_report(pricing, currency)
        puts "Item     Quantity      Price"
        puts "--------------------------------------"

        pricing.sold_items.each do |item_name, sold_item|
          puts "#{item_name.capitalize}    #{sold_item.quantity}    #{currency}#{sold_item.sold_price.round(ROUNDING_PRICES)}"
        end
        puts "Total price: #{currency}#{pricing.total_price.round(ROUNDING_PRICES)}"
        puts "You saved #{currency}#{pricing.discount.round(ROUNDING_PRICES)} today"
      end

    end
  end

end
