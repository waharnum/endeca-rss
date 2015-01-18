require 'json'

require 'nokogiri'
require 'open-uri'
require './endeca_record'

class EndecaSearch
	attr_reader :endeca_query
	attr_accessor :endeca_records

	def initialize(eq)
		@endeca_query = eq
		@endeca_records = []
		get_records_from_tpl_rss("www")
	end	

	def get_rss_url(domain, endeca_query_string)
		return "http://#{domain}.torontopubliclibrary.ca/rss.jsp?#{endeca_query_string}"	
	end

	def get_records_from_tpl_rss(domain)
		rss_search_url = get_rss_url(domain,@endeca_query)
		rss_search = Nokogiri::XML(open(rss_search_url))      
			rss_search.encoding = 'utf-8'
			rss_search.xpath("//item/record").each do |record|
				rec = EndecaRecord.new(record.xpath("recordId").inner_html)		
				record.xpath("attributes/attr").each do |attribute|
					rec.record_attributes[attribute['name']] = attribute.inner_html						
				end
				@endeca_records.push(rec)
			end			
	end

end