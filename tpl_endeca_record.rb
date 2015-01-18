class TPLEndecaRecord
	attr_reader :record_id
	attr_accessor :record_attributes
	def initialize(rec_id)
		@record_id = rec_id
		@record_attributes = {}
	end

end