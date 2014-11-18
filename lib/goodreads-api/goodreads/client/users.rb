module Goodreads
	module Users
		def user(id)
			response = request('/user/show', :id => id)
			Hashie::Mash.new(response['user'])
		end
	end
end