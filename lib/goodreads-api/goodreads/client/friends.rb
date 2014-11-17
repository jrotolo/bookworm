module Goodreads
	module Friends
		
		def friends(user_id)
			response = oauth_request("/friend/user/#{user_id}")
			Hashie::Mash.new(data['friends'])
		end
	end
end