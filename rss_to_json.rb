# http://www.torontopubliclibrary.ca/rss.jsp?Ntt=babies
# http://www.torontopubliclibrary.ca/rss.jsp?N=37867+37850

require 'nokogiri'
require 'open-uri'
require './endeca_record'

def get_rss_url(domain, endeca_query_string)
	return "http://#{domain}.torontopubliclibrary.ca/rss.jsp?#{endeca_query_string}"	
end

def tpl_rss_to_objects(domain, endeca_query_string)
	search_records = []
	rss_search_url = get_rss_url(domain,endeca_query_string)
	rss_search = Nokogiri::XML(open(rss_search_url))      
	rss_search.encoding = 'utf-8'
	rss_search.xpath("//item/record").each do |record|
		rec = EndecaRecord.new(record.xpath("recordId").inner_html)		
		record.xpath("attributes/attr").each do |attribute|
			rec.record_attributes[attribute['name']] = attribute.inner_html						
		end
		search_records.push(rec)
	end	
	return search_records
end

endeca_query = "N=37867+37850"
prod_domain = "www"
search_records = tpl_rss_to_objects(prod_domain, endeca_query)
search_records.each do |record|
	puts record.to_json
end

