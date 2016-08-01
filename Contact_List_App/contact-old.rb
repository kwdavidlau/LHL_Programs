require 'csv'
require 'pry'
require 'pg'

class Contact

  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
    # TODO: Assign parameter values to instance variables.
  end

  def save
    # conn = Contact.connection
    # conn.exec_params('INSERT INTO contacts (name, email) VALUES ($1, $2);',[name,email])

    conn = Contact.connection
    if x.name == name && x.email == email
      conn.exec_params('UPDATE contacts SET name = $1, email = $2 WHERE id = $1::int;',[name,email])
    else
      conn.exec_params('INSERT INTO contacts (name, email) VALUES ($1, $2);',[name,email])
    end
  end
  # Provides functionality for managing contacts in the csv file.
  class << self

    def all
      conn = self.connection
      arr = []
      conn.exec('SELECT * FROM contacts;') do |results|
        results.each do |author|
          arr << Contact.new(author['name'],author['email'])
        end
      end
      arr
    end

    def create(name, email)
      new_contact = Contact.new(name,email)
      new_contact.save
    end

    def find(id)
      conn = self.connection
      person = conn.exec_params('SELECT * FROM contacts WHERE id = $1::int;',[id])[0]
      Contact.new(person[:name],person[:email])
      # binding.pry
      person
      #
    end

    def search(name)
      conn = self.connection
      x = conn.exec_params('SELECT * FROM contacts WHERE name LIKE $1;',["%#{name}%"])
      array = []
      x.each do |x|
        array << Contact.new(x[:name],x[:email])
      end
      array[0]
    end

    def connection
      conn = PG.connect(
        # host: 'localhost',
        # dbname: 'postgres',
        # user: 'vagrant',
        # password: 'vagrant'

        host: 'localhost',
        dbname: 'contacts',
        user: 'paulalau',
        password: 'paulalau'
      )
      conn
      # binding.pry
    end

  end
end
