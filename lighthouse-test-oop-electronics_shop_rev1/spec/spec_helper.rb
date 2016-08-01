require 'rspec'
require 'pry'
require 'byebug'

def safe_require(file)
  require file
rescue LoadError
  # ignore
end

safe_require 'shop'
safe_require 'customer'
safe_require 'product'
safe_require 'laptop'
safe_require 'cellphone'
safe_require 'tv'
