module Goodreads
	module Shelves
		
		# Get books from user's shelf
		def shelf(user_id, shelf_name, args={})
			# Deal with options
			args = args.merge!(:shelf => shelf_name, :v => 2)

			# send out request
			response = request("/review/list/#{user_id}.xml", args)
			reviews = response['reviews']['review']

			# Grab books from users shelf
			books = []

			# if reviews exist put them into an array
			unless reviews.nil?
				reviews = [reviews] 
				# make earch book an instance of Hashie::Mash from reviews
				books = reviews.map { |e| Hashie::Mash.new(e) } 
			end

			# This represents a shelf object
			Hashie::Mash.new({
				:start => data['reviews']['start'].to_i,
				:end => data['reviews']['end'].to_i,
				:total => data['reviews']['total'].to_i,
				:books => books
			})
				
		end	
	end
end
