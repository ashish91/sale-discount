module Models

  class UnitPrice
    attr_reader :currency, :price

    def initialize(price:, currency:)
      self.price = price
      self.currency = currency
    end

    private
      attr_writer :currency, :price
  end

end
