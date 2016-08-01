class Customer

  attr_reader :cart, :temp_cart
  def initialize(budget = 500, cart = [])
    @budget = budget
    @cart = cart
    @temp_cart = 0
  end

  def budget
    if @budget.nil?
      @budget = 500
    else
      @budget
    end
  end

  def add_to_cart(item)
    return false if @temp_cart+item.price > @budget
    return false if @cart.length == 5
    @cart << item
    @temp_cart += item.price
    return true
  end

  def checkout(shop)
    @budget -= @temp_cart
    @cart.each do |x|
      shop.sales << x
      shop.inventory.delete(x)
    end
    @cart = []
  end

end


# bundle exec rspec spec/07_customer_can_checkout_on_shop.rb
