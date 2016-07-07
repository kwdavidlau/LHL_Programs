require 'date'
require 'pry'

class Teacher < ActiveRecord::Base
  has_many :students

  validates :email,                 uniqueness: true
  # validates :hire_date,   presence: true


  # after_save if: :hire_date
  after_save :validate_retirement, if: :retirement_date
  after_save :double_check, if: :retirement_date

  def validate_retirement
    hire = (Date.today - hire_date).to_i/365
    retire = (Date.today - retirement_date).to_i/365
    errors.add(:retirement_date, message: "Can't be before hire") if retire > hire || retirement_date <= Date.today
  end

  def double_check
    self.reload
    self.students.all.each do |student|
      student.teacher_id = nil
      student.save
      student.reload
      binding.pry
    end
    # students.save
  end

end
