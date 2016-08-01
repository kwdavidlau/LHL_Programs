class Product
  attr_reader :name, :brand
  attr_accessor :price
  def initialize(name, price, brand)
    @name = name
    @price = price
    @brand = brand
  end
end
