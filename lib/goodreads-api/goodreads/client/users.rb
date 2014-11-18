module Goodreads
	module Users

		# Get user by id
		def user(id)
			response = request('/user/show', :id => id)
			Hashie::Mash.new(response['user'])
		end
	end
end