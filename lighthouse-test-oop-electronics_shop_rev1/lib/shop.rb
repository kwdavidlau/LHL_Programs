class Shop
  attr_reader :name, :inventory, :sales, :revenue, :count_of_stock
  def initialize(name, inventory = [], sales = [])
    @name = name
    raise ArgumentError, "name required" if name.nil?
    raise ArgumentError, "name required" if name.strip.length == 0
    @inventory = inventory
    @sales = sales
    @count_of_stock = {}
  end

  def add_to_inventory(item)
    raise ArgumentError, "product required" if item.nil?
    @inventory << item
  end

  def sell_item(which_item)
    return false if !@inventory.include?(which_item)
    self.sales << which_item
    @inventory.delete(which_item)
    which_item
  end

  def revenue
    self.sales.inject(0){|sum,x| sum + (x.price) }
  end

  def stock
    @inventory.map {|x|
      if @count_of_stock[x.name].nil?
        @count_of_stock[x.name] = 1
      else
        @count_of_stock[x.name] += 1
      end
    }
    @count_of_stock
  end
end



# bundle exec rspec spec/04_subtypes_of_product.rb
# bundle exec rspec spec/03_shop_has_inventory_and_sales.rb
# bundle exec rspec spec/02_customer_has_cart_and_budget.rb
# 01_product_has_brand_and_info
# bundle exec rspec spec/01_product_has_brand_and_info.rb
# bundle exec rspec spec/05_shop_methods.rb
# bundle exec rspec spec/06_customer_can_add_to_cart.rb
# bundle exec rspec spec/08_shop_exceptions.rb
# bundle exec rspec spec/09_shop_stock_as_hash.rb
