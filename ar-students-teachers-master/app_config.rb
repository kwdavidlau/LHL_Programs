require 'active_record'
require 'active_support/all'
require './lib/students_importer'
require './lib/teachers_importer'
require './app/models/student'
require './app/models/teacher'
# Add new app/ and lib/ files here when they are created.

module AppConfig

  DATABASE = ENV['DATABASE'] || 'development'

  DATABASE_PATH = File.absolute_path("db/#{DATABASE}.sqlite3", File.dirname(__FILE__))

  def self.establish_connection
    puts "Connecting to database '#{DATABASE_PATH}'"
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: DATABASE_PATH
    )
  end

end

#
AppConfig.establish_connection

p = Teacher.first
p.hire_date = nil
p.retirement_date = nil
p.save

x = Student.first
x.teacher = Teacher.first
x.save

y = Student.last
y.teacher = Teacher.first
y.save

t = Teacher.first
t.students
t.save
t.reload
# # # #
# # # # #
# # # #
#
t.hire_date = '1970-01-01'
t.retirement_date = '1990-01-01'



# t.save
# t.reload



#  bundle exec rspec spec/new_student_tasks.rb
# pry -r './app_config.rb'
# AppConfig.establish_connection
# touch $(date '+%Y%m%d%H%M%S')_migration_name.rb

# rake db:drop db:create db:migrate
#
