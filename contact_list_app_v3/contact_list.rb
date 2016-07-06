# require_relative 'contact'
require_relative 'setup'
require 'pry'
puts "Enters file"
Contact.create(name: "Joe", email: "joekim@gmail.com")
Contact.create(name: "sam", email: "Sam@gmail.com")


# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList
  if ARGV[0].nil?
    puts "Here is a list of available commands: "
    puts "\tnew    - Create a new contact"
    puts "\tlist   - List all contacts"
    puts "\tshow   - Show a contact"
    puts "\tsearch - Search contacts"
  elsif ARGV[0] == "list"
    puts Contact.all.count
  elsif ARGV[0] == "new"
    Contact.create(name: ARGV[1], email: ARGV[2]).save
    puts Contact.all.count
  elsif ARGV[0] == "show"
    x = Contact.find(ARGV[1].to_i)
    puts "#{x.name}: #{x.email}"
  elsif ARGV[0] == "search"
    x = Contact.where('id = ?', ARGV[1].to_i)
    x.each do |y|
      puts "#{y[:name]}: #{y[:email]}"
    end
  elsif ARGV[0] == "update"
    the_contact = Contact.find_by(id: ARGV[1])
    puts "Change name."
    name_change = STDIN.gets.chomp
    puts "Change email"
    email_change = STDIN.gets.chomp

    the_contact.update(name: name_change, email: email_change)
  end
end
