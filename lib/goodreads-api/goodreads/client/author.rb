module Goodreads
	module Author

		# Get author info by author id
		def author(id, args={})
			args[:id] = id
			response = request('/author/show', args)
			Hashie::Mash.new(response['author'])
		end

		# Get author info by author name
		def author_by_name(name, args={})
			args[:name] = name
			response = request('/author/author_url', args)
			Hashie::Mash.new(response['author'])
		end
	end
end
