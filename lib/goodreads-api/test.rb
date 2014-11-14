require "./goodreadsapi"
require "nokogiri"

raw_xml = GoodreadsApi.get_user_info(512)
xml_doc = Nokogiri::XML("test.xml")

all_results = xml_doc.xpath("//GoodreadsResponse//user")
book_title = ""

all_results.each do |product|
	book_title = product.xpath("id").text
end

puts  all_results


