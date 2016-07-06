require_relative '../setup'

puts "Exercise 1"
puts "----------"

# Your code goes below here ...
class Store < ActiveRecord::Base
  has_many :employees

  validates :name, format: /\w\w\w+/
  validates :annual_revenue, numericality: {greater_than_or_equal_to: 0}
end

class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :hourly_rate, numericality: {greater_than: 40, less_than: 200}
end


Store.create(name: "Burnaby", annual_revenue: 300_000, mens_apparel: true, womens_apparel: true)
Store.create(name: "Richmond", annual_revenue: 1260000, mens_apparel: false, womens_apparel: true)
Store.create(name: "Gastown", annual_revenue: 190000, mens_apparel: true, womens_apparel: false)
puts Store.count
