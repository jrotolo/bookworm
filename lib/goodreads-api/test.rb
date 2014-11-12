require "./goodreadsapi"
require "nokogiri"

raw_xml = GoodreadsApi.search_books("Ender's Game")
xml_doc = Nokogiri::XML(raw_xml) do |config|
	config.noblanks
end

print raw_xml

