# Homepage (Root path)
require 'pry'

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  json @contacts.as_json
end

post '/contacts' do
  @contact = Contact.new(
    name: params[:name],
    address: params[:address],
    phone_number: params[:phone_number]
    )
  @contact.save
  json @contact.as_json
end

get '/contacts/:id' do
  @contact = Contact.find params[:id]
  json @contact.as_json
end

post '/contacts/:id/edit' do
  @contact = Contact.find params[:id]
  @contact.name = params['name']
  @contact.address = params['address']
  @contact.phone_number = params['phone_number']
  @contact.save
end

post '/contacts/:id/delete' do
  @contact = Contact.find params[:id]
  # binding.pry
  @contact.destroy()
end


# post '/contacts' do
#   @contact = Contact.new(
#     name: params[:name],
#     phone_number: params[:phone_number],
#     address: params[:address]
#   )
#   if @contact.save
#     redirect '/contacts'
#   else
#     erb :'contacts/new'
#   end
# end
#
# get '/contacts/new' do
#   @contact = Contact.new
#   erb :'contacts/new'
# end
