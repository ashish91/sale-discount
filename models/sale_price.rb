module Models

  class SalePrice
    attr_accessor :units, :price

    def initialize(units:, price:)
      self.units = units
      self.price = price
    end
  end

end
