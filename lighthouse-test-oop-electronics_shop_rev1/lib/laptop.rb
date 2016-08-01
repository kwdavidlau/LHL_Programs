class Laptop < Product
  attr_reader :size, :ram, :processor
  def initialize(name, price, model, specs)
    super(name,price,model)
    @ram = specs[:ram]
    @processor = specs[:processor]
    @size = specs[:size]
  end
end
