require_relative 'spec_helper'
require 'date'
require 'pry'

describe Student do
  before (:each) do
    @student = Student.create(first_name: "New", last_name: "New", gender: "M", birthday: "1979-01-01", email: "cody.z@example.ca", phone: "12221")
    @teacher = Teacher.create(
      name: 'Random',
      email: 'random@random.com',
      address: 'RandomStreet',
      phone: '111-111-1111',
      hire_date:'1980-01-01'
      # retirement_date:'1990-01-01'
    )
  end

  it '#last_student_added_at' do
    # binding.pry
    @student.teacher = @teacher
    @student.save
    expect(@teacher.last_student_added_at).to eq(Date.today)
  end
end
