module Goodreads
	module Friends
		
		# get friends by user id
		def friends(user_id)
			response = oauth_request("/friend/user/#{user_id}")
			Hashie::Mash.new(data['friends'])
		end
	end
end