module Goodreads
	module Shelves
		
		# Get books from user's shelf
		def shelf(user_id, shelf_name, args={})
			args = args.merge!(:shelf => shelf_name, :v => 2)

			response = request("/review/list/#{user_id}.xml", args)
			reviews = response['reviews']['review']

			books = []

			unless reviews.nil?
				reviews = [reviews] 
				books = reviews.map { |e| Hashie::Mash.new(e) } 
			end

			Hashie::Mash.new({
				:start => data['reviews']['start'].to_i,
				:end => data['reviews']['end'].to_i,
				:total => data['reviews']['total'].to_i,
				:books => books
			})
				
		end	
	end
end
