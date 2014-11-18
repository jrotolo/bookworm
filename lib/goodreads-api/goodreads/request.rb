require 'rest-client'
require 'active_support/core_ext'
require 'hashie'

module Goodreads
	module Request
		BASE_URL = "http://www.goodreads.com"
		API_FORMAT = "xml"

		# Perform an API request
		# path - Request path
		# args - Arguments hash
		def request(path, args={})
			url = "#{BASE_URL}#{path}"
			key = api_key || Goodreads.config[:api_key]	

			if key.nil?
				puts 'API key required'
			end


			args.merge!(:format => API_FORMAT, :key => key)


			reply = RestClient.get(url, :params => args) do |response, request, result, &block| 
				case response.code
					when 200
						response.return!(request, result, &block)
					when 401
						puts "401: Unathorized"
					when 404
						puts "404: Page Not Found"
				end
			end

			parse(reply)
		end

		# Parse xml response from goodreads
		def parse(response)
			hash = Hash.from_xml(response.body)['GoodreadsResponse']
			hash.delete('Request')
			hash
		end
    end
  end
