module Models

  class Item
    attr_accessor :unit_price, :sale_price, :name

    def initialize(name:)
      self.name = name
    end
  end

end
