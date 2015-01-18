require 'json'

class EndecaRecord
	attr_reader :record_id
	attr_accessor :record_attributes
	def initialize(rec_id)
		@record_id = rec_id
		@record_attributes = {}
	end

	def to_json
		{'record_id' => @record_id, 'attributes' => @record_attributes}.to_json
	end
end