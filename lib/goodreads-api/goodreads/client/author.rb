module Goodreads
	module Author
		# Get author info
		def author(id, args={})
			args[:id] = id
			response = request('/author/show', args)
			Hashie::Mash.new(response['author'])
		end

		def author_by_name(name, args={})
			args[:name] = name
			response = request('/author/author_url', args)
			Hashie::Mash.new(response['author'])
		end
	end
end
