require 'puma'
require 'sinatra'
require 'open-uri'

# http://www.torontopubliclibrary.ca/rss.jsp?Ntt=babies

get '/search' do   
  "Query string is: #{request.query_string}"
end