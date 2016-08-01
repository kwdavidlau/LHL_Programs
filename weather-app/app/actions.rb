# Homepage (Root path)
require 'pry'

get '/' do
  erb :index
end

# get 'http://autocomplete.wunderground.com/aq?query/=query' do
#   binding.pry
# end
