require 'puma'
require 'sinatra'
require 'rubygems' 
require 'rabl'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'builder'
require './endeca_search'

Rabl.register!

# set :bind, '104.131.20.49'

get '/search' do   
	@endeca_search = EndecaSearch.new(request.query_string)	
	rabl :endeca_search, :format => "json"  	
end