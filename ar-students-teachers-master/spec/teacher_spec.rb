require_relative 'spec_helper'

describe Teacher do
  # before(:all) do
  #   raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teacher)
  # end

  before(:each) do
    @teacher = Teacher.new
    @teacher.assign_attributes(
      name: 'Joe',
      email: 'Joe@joe.com',
      address: 'Joe Street',
      phone: '111-111-1111'
    )
  end

  describe '#name, email and address' do
    it 'should accept valid info' do
      expect(@teacher).to be_valid
    end
  end

  describe 'validations' do
    before(:each) do
      @teacher = Teacher.new
      @teacher.assign_attributes(
        name: 'Sam',
        email: 'Sam@Sam.com',
        address: 'Sam Street',
        phone: '111-111-1111'
      )
    end

    it "shouldn't allow two teachers with the same email" do
      Teacher.create!(
        name: @teacher.name,
        email: @teacher.email,
        address: @teacher.address,
        phone: @teacher.phone
      )
      expect(@teacher).to_not be_valid
    end
  end
end
