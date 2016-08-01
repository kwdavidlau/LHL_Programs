require_relative 'spec_helper'

describe Shop do
  describe '#initialization' do
    it 'raises an error if name is nil' do
      expect { Shop.new(nil) }.to raise_error(ArgumentError, 'name required')
    end
    it 'raises an error if name is essentially empty' do
      expect { Shop.new('   ') }.to raise_error(ArgumentError, 'name required')
    end
    it 'does not raise an error otherwise (like before)' do
      expect { Shop.new('Florist Gump') }.to_not raise_error
    end
  end

  describe '#add_to_inventory' do
    it 'raises an error if trying to add nil product to inventory' do
      shop = Shop.new('Spruce Springclean')
      expect { shop.add_to_inventory(nil) }.to raise_error(ArgumentError, 'product required')
    end
  end
end
