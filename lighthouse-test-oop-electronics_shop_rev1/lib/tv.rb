class Tv < Product
  attr_reader :size
  def initialize(name,price, brand,size)
    super(name,price,brand)
    @size = size
  end
end
