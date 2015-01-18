# http://www.torontopubliclibrary.ca/rss.jsp?Ntt=babies
# http://www.torontopubliclibrary.ca/rss.jsp?N=37867+37850

require './endeca_search'

endeca_query = "N=37867+37850"
es = EndecaSearch.new(endeca_query)

es.endeca_records.each do | record|
	puts record.record_id
	puts record.record_attributes
end
