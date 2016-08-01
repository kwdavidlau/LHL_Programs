require_relative 'spec_helper'

describe Laptop do
  before :each do
    specs_13 = { ram: '4 GB', processor: 'Intel i3', size: 13 }
    @macbook_air_13 = Laptop.new('Macbook Air', 999, 'Apple', specs_13)
    specs_11 = { ram: '8 GB', processor: 'Intel i5', size: 14 }
    @samsung_ultrabook = Laptop.new('Samsung Ultrabook', 759, 'Samsung', specs_11)
  end

  it 'should be a product' do
    expect(@macbook_air_13).to be_a(Product)
    expect(@samsung_ultrabook).to be_a(Product)
  end

  it 'should have a name, price and model' do
    expect(@macbook_air_13.name).to eq('Macbook Air')
    expect(@samsung_ultrabook.name).to eq('Samsung Ultrabook')
  end

  it 'should have a size, taken from the specs hash' do
    expect(@macbook_air_13.size).to eq(13)
    expect(@samsung_ultrabook.size).to eq(14)
  end

  it 'should have ram, taken from the specs hash' do
    expect(@macbook_air_13.ram).to eq('4 GB')
    expect(@samsung_ultrabook.ram).to eq('8 GB')
  end

  it 'should have a processor description, taken from the specs hash' do
    expect(@macbook_air_13.processor).to eq('Intel i3')
    expect(@samsung_ultrabook.processor).to eq('Intel i5')
  end
end

describe Cellphone do
  before :each do
    @iphone_7s = Cellphone.new('iPhone 7S', 899, 'Apple')
    @samsung_note7 = Cellphone.new('Samsung Note 7', 799, 'Samsung')
  end

  it 'should be a product' do
    expect(@iphone_7s).to be_a(Product)
    expect(@samsung_note7).to be_a(Product)
  end

  it 'should have a name' do
    expect(@iphone_7s.name).to eq('iPhone 7S')
    expect(@samsung_note7.name).to eq('Samsung Note 7')
  end

  it 'should have a price' do
    expect(@iphone_7s.price).to eq(899)
    expect(@samsung_note7.price).to eq(799)
  end
end

describe Tv do
  before :each do
    @lg_smart_tv = Tv.new('54" LG Smart TV', 1099, 'LG', 54)
  end

  it 'should be a product' do
    expect(@lg_smart_tv).to be_a(Product)
  end

  it 'should have a name' do
    expect(@lg_smart_tv.name).to eq('54" LG Smart TV')
  end

  it 'should have a price' do
    expect(@lg_smart_tv.price).to eq(1099)
  end

  it 'should have a size' do
    expect(@lg_smart_tv.size).to eq(54)
  end
end
