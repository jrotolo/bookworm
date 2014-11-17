module Goodreads
	module Reviews

		# Get review by id
		def review(id)
			response = request('/review/show', :id => id)
			Hashie::Mash.new(response['review'])	
		end

	end
end