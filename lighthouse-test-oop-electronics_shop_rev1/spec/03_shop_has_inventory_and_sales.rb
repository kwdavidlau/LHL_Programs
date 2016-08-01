require_relative 'spec_helper'

describe Shop do
  describe 'initialization' do
    before :each do
      @shop = Shop.new('Bestbuy')
    end

    it 'should have a name' do
      expect(@shop.name).to eq('Bestbuy')
    end

    it 'should have an empty inventory (list of products)' do
      expect(@shop.inventory).to eq([])
    end

    it 'should have no sales (list of products sold)' do
      expect(@shop.sales).to eq([])
    end
  end
end
