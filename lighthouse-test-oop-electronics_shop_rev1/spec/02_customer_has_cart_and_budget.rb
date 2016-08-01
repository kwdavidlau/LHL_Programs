require_relative 'spec_helper'

describe Customer do
  before :each do
    @john = Customer.new(100)
    @jane = Customer.new(200)
  end

  it 'initially has not purchased any item, default to empty cart' do
    expect(@john.cart).to eq([])
    expect(@jane.cart).to eq([])
  end

  it 'has a budget of initialized value' do
    expect(@john.budget).to eq(100)
    expect(@jane.budget).to eq(200)
  end

  it 'defaults budget to 500 if nil' do
    @bob = Customer.new(nil)
    expect(@bob.budget).to eq(500)
  end

  it 'defaults budget to 500 if not provided' do
    @sarah = Customer.new
    expect(@sarah.budget).to eq(500)
  end

end
