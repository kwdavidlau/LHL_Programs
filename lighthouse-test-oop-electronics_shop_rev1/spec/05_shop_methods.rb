require_relative 'spec_helper'

describe Shop do
  describe '#add_to_inventory' do
    before :each do
      @shop = Shop.new('Future Shop')
      @macbook = Product.new('Macbook Pro 13" Retina', 1400, 'Apple')
      @iphone = Product.new('iPhone 6s', 900, 'Apple')
    end

    it 'should have an empty inventory list' do
      expect(@shop.inventory).to eq([])
    end

    it 'can add a product to inventory' do
      @shop.add_to_inventory(@macbook)
      expect(@shop.inventory.length).to eq(1)
      @shop.add_to_inventory(@iphone)
      expect(@shop.inventory.length).to eq(2)
    end

    it 'inventory is a list of products' do
      @shop.add_to_inventory(@macbook)
      expect(@shop.inventory[0]).to be(@macbook)
      @shop.add_to_inventory(@iphone)
      expect(@shop.inventory[1]).to be(@iphone)
    end
  end

  describe '#sell_item' do
    before :each do
      @shop = Shop.new('Canada Computers')
      @macbook_air_13 = Laptop.new('Macbook Air', 999, 'Apple', {})
      @samsung_note7 = Cellphone.new('Samsung Note 7', 799, 'Samsung')
      @lg_smart_tv = Tv.new('54" LG Smart TV', 1099, 'LG', 54)
    end

    it 'returns the purchased item' do
      @shop.add_to_inventory(@macbook_air_13)
      item_sold = @shop.sell_item(@shop.inventory[0])
      expect(item_sold).to be_a(Laptop)
    end

    it 'returns false if the item does not exist in the inventory' do
      item_sold = @shop.sell_item(@lg_smart_tv)
      expect(item_sold).to eq(false)
    end

    it 'adds the purchased product to the sales list' do
      @shop.add_to_inventory(@samsung_note7)
      item_sold = @shop.sell_item(@shop.inventory[0])
      expect(@shop.sales[0]).to be_a(Cellphone)
      expect(@shop.sales.length).to eq(1)
    end

    it 'removes the purchased product from inventory' do
      @shop.add_to_inventory(@samsung_note7)
      expect(@shop.inventory.length).to eq(1)
      item_sold = @shop.sell_item(@shop.inventory[0])
      expect(@shop.inventory.length).to eq(0)
    end
  end

  describe '#revenue' do
    before :each do
      @shop = Shop.new('Canada Computers')

      the_products = [
        Laptop.new('Macbook Air', 999, 'Apple', {}),
        Cellphone.new('Samsung Note 7', 799, 'Samsung'),
        Tv.new('54" LG Smart TV', 1_099, 'LG', 54)
      ]

      allow(@shop).to receive(:sales).and_return(the_products)
    end

    it 'returns the sum of the price of the products that were sold' do
      expect(@shop.revenue).to eq(2_897)
    end
  end
end
