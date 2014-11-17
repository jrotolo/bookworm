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
			# Build url
			url = "#{BASE_URL}#{path}"
			key = api_key || Goodreads.config[:api_key]	

			# Error need api key
			if key.nil?
				puts 'API key required'
			end

			# Set up params
			args.merge!(:format => API_FORMAT, :key => key)

			# Handle request with RestClient
			reply = RestClient.get(url, :params => args){ |response, request, result, &block|
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

		def parse(response)
			hash = Hash.from_xml(response.body)['GoodreadsResponse']
			hash.delete('Request')
			hash
		end
	end
end