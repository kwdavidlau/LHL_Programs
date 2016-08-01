require_relative 'spec_helper'

describe Shop do
  
  describe '#stock' do
    it 'returns a hash where keys are the product names and value is the quantity' do
      shop = Shop.new('Woofs a Daisy')
      tv     = Tv.new('Smart TV', 1_049, 'LG', 54)
      phone  = Cellphone.new('iPhone 7S', 899, 'Apple')
      laptop = Laptop.new('Macbook Air', 999, 'Apple', {})

      shop.inventory.push tv
      shop.inventory.push tv
      shop.inventory.push phone
      shop.inventory.push laptop
      shop.inventory.push phone
      shop.inventory.push tv

      expect(shop.stock).to eq({
        'Smart TV'    => 3,
        'iPhone 7S'   => 2,
        'Macbook Air' => 1
      })
    end

    it 'returns a hash where keys are the product names and value is the quantity (double check ;)' do
      shop = Shop.new('Woofs a Daisy')
      tv     = Tv.new('Dumb TV', 1_049, 'LG', 54)
      phone  = Cellphone.new('iPhone 6S', 899, 'Apple')
      laptop = Laptop.new('Macbook Pro', 999, 'Apple', {})

      shop.inventory.push tv
      shop.inventory.push phone
      shop.inventory.push phone
      shop.inventory.push laptop
      shop.inventory.push phone
      shop.inventory.push tv
      shop.inventory.push phone

      expect(shop.stock).to eq({
        'Dumb TV'     => 2,
        'iPhone 6S'   => 4,
        'Macbook Pro' => 1
      })
    end
  end

end
