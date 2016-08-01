require_relative 'spec_helper'

describe Product do
  describe 'Initialization and attributes for Apple product' do
    before :each do
      @macbook = Product.new('Macbook Pro 13" Retina', 1400, 'Apple')
    end

    it 'should have a name' do
      expect(@macbook.name).to eq('Macbook Pro 13" Retina')
    end

    it 'should have a price' do
      expect(@macbook.price).to eq(1400)
    end

    it 'should have a brand' do
      expect(@macbook.brand).to eq('Apple')
    end
  end

  describe 'Initialization and attributes for Android product' do
    before :each do
      @galaxy = Product.new('Galaxy S7', 900, 'Samsung')
    end

    it 'should have a name' do
      expect(@galaxy.name).to eq('Galaxy S7')
    end

    it 'should have a price' do
      expect(@galaxy.price).to eq(900)
    end

    it 'should have a brand' do
      expect(@galaxy.brand).to eq('Samsung')
    end
  end

  describe 'attribute setting' do

    before :each do
      @galaxy = Product.new('Galaxy S7', 900, 'Samsung')
    end

    it 'throws a NoMethodError if attempted on name' do
      expect { @galaxy.name = 'Far Far Away' }.to raise_error(NoMethodError)
    end

    it 'okay for price' do
      @galaxy.price = 1
      expect(@galaxy.price).to eq(1)
    end

    it 'throws a NoMethodError if attempted on brand' do
      expect { @galaxy.brand = 'HTC' }.to raise_error(NoMethodError)
    end

  end

end
