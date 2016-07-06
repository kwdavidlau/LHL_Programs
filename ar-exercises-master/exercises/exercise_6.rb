require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "David", last_name: "Lau", hourly_rate: 100)
@store2.employees.create(first_name: "Jojo", last_name: "Jo", hourly_rate: 30)
@store2.employees.create(first_name: "Ro", last_name: "Sam", hourly_rate: 80)
