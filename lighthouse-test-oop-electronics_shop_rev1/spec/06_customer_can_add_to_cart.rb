require_relative 'spec_helper'

describe Customer do
  describe '#add_to_cart' do
    before :each do
      # cheap prices cause they are used ;)
      @android        = Cellphone.new('HTC pos',   400, 'HTC')
      @iphone_7s      = Cellphone.new('iPhone 7S', 600, 'Apple')
      @expensive_tv   = Tv.new('54" LG Smart TV',  1_699, 'LG', 54)

      # Note the $3,000 budget
      @customer = Customer.new(3000)
    end

    it 'appends product to their cart and returns true' do
      # start with the android in there already
      @customer.cart.push @android

      expect(@customer.add_to_cart(@iphone_7s)).to be(true)
      # since android was already there there should be 2 in there now
      expect(@customer.cart.length).to eq(2)
      expect(@customer.cart).to include(@iphone_7s)
    end

    it "can't add more than 5 items to cart (returns false)" do
      (1..5).each do
        @customer.add_to_cart(@android)
      end
      expect(@customer.cart.length).to eq(5)
      expect(@customer.add_to_cart(@android)).to eq(false)
      expect(@customer.cart.length).to eq(5)
    end

    it "more importantly, can't add more items if item puts them goes *over* their budget" do
      @customer.add_to_cart(@expensive_tv)
      expect(@customer.cart.length).to eq(1)

      # second expensive tv puts us over budget of $3,000 since each is 1,699.
      # therefore method returns false and doesn't add to cart
      expect(@customer.add_to_cart(@expensive_tv)).to eq(false)
      expect(@customer.cart.length).to eq(1)
    end

    it 'that said, allows 5 items where total value is exactly the budget' do
      # 5x iPhones @ 600 = 3000, which is right on budget (not over)
      (1..5).each do
        phone = Cellphone.new('iPhone 7S', 600, 'Apple')
        expect(@customer.add_to_cart(phone)).to eq(true)
      end
      expect(@customer.add_to_cart(@iphone_7s)).to eq(false)
      expect(@customer.cart.length).to eq(5)
    end

  end

end
