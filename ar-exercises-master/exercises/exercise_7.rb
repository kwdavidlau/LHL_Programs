require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
puts "Give me a store name"
x = gets.chomp
test = Store.create(name: x)
test.save
test.errors.messages.each {|x,y| puts "#{x}:#{y}"}

puts "Give me an employee name"
x = gets.chomp
test = Employee.create(first_name: x)
test.save
test.errors.messages.each {|x,y| puts "#{x}:#{y}"}
