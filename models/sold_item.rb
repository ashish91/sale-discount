module Models

  class SoldItem
    attr_accessor :item, :quantity, :sold_price

    def initialize(item:, quantity:)
      self.item = item
      self.quantity = quantity
    end
  end

end
