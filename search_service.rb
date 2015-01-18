require 'puma'
require 'sinatra'
require 'open-uri'

# http://www.torontopubliclibrary.ca/rss.jsp?Ntt=babies

get '/search' do 
  puts params
  "#{params}"
end