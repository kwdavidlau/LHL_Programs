require 'date'
require 'pry'

class Student < ActiveRecord::Base
  # implement your Student model here
  # validates :age
  belongs_to :teacher
  # validates :age,     numericality:
  validates :email,     uniqueness:true, format: /\w+@\w+.\w+.?\w+/
  validate :validate_age

  def age
    # binding.pry
    (Date.today - self.birthday).to_i/365
  end

  def name
    "#{first_name} #{last_name}"
  end

  def validate_age
    # binding.pry
    errors.add(:birthday, message: "Can't be toddler") if age <= 3
  end
end
