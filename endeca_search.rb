require 'json'

class EndecaSearch
	attr_reader :endeca_query
	attr_accessor :endeca_records

	def initialize(eq)
		@endeca_query = eq
		@endeca_records = []
	end	

end