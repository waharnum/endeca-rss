require 'puma'
require 'sinatra'
require 'open-uri'
require 'rubygems' 
require 'rabl'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'builder'

# http://www.torontopubliclibrary.ca/rss.jsp?Ntt=babies

get '/search' do   
  "Query string is: #{request.query_string}"
end