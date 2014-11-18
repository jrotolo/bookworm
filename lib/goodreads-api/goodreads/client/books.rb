module Goodreads
	module Books
		
		# Search for books
		# query - term to match book title, author, or ISBN
		# args[:field] - search field. (title, author, or genre)
		def search_books(query, args={})
			args[:query] = query.to_s.strip
			response = request('/search/index/', args)
			Hashie::Mash.new(response['search'])
		end

		# Get book by id
		def book(id)
			response = request('/book/show', :id => id)
			Hashie::Mash.new(response['book'])
		end

		# Get book by ISBN
		def book_by_isbn(isbn)
			response = request('/book/isbn', :isbn => isbn)
			Hashie::Mash.new(response['book'])				
		end

		# Get book by title
		def book_by_title(title)
			response = request('/book/title', :title => title)
			Hashie::Mash.new(response['book'])
		end

		# Get book by author
		def book_by_author(author)
			response = request('/book/author', :author => author)
			Hashie::Mash.new(response['book'])
		end

		# Get a list of books in a series
		def book_by_series(id)
			response = request('/series/show', :id => id)
		end

	end
end
