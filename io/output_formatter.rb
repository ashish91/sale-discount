module Io

  class OutputFormatter
    class << self

      def please_enter_text
        puts "Please enter all the items purchased separated by a comma"
      end

      def price_report
        puts "Item     Quantity      Price"
        puts "--------------------------------------"
      end

    end
  end

end
