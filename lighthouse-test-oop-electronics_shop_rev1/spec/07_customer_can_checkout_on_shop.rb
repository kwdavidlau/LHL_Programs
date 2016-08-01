require_relative 'spec_helper'

describe Customer do
  describe '#checkout' do
    before :each do
      @iphone_7s = Cellphone.new('iPhone 7S', 899, 'Apple')
      @lg_smart_tv = Tv.new('72" LG Smart TV', 1_049, 'LG', 54)
      @shop = Shop.new('Tech Plus')
      @shop.add_to_inventory(@iphone_7s)
      @shop.add_to_inventory(@lg_smart_tv)
      @customer = Customer.new(2000)
      @customer.add_to_cart(@iphone_7s)
      @customer.add_to_cart(@lg_smart_tv)
    end

    it 'should empty the cart' do
      expect(@customer.cart.length).to eq(2)
      @customer.checkout(@shop)
      expect(@customer.cart.length).to eq(0)
    end

    it 'should deduct cart total from customer budget' do
      expect(@customer.budget).to eq(2000)
      @customer.checkout(@shop)
      # $52 left from $2,000 budget after buying both products in cart
      expect(@customer.budget).to eq(52)
    end

    it "should update shop by adding all products in cart to shop's sales" do
      @customer.checkout(@shop)
      expect(@shop.sales.length).to eq(2)
    end

    it "should remove the products purchased from the shop's inventory" do
      expect(@shop.inventory.length).to eq(2)
      @customer.checkout(@shop)
      expect(@shop.inventory.length).to eq(0)
    end
  end
end
