module Io

  class InputFormatter
    class << self

      def parse_items(items_line)
        items = items_line.split(',')
        items = items.map { |item| item.strip.downcase.to_sym }
        items.delete_if(&:empty?)

        items
      end

    end
  end

end
