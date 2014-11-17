class BooksController < ApplicationController
	
	# Route : books/index
	# The default book page
	def index
		if params[:search]
   			@books = client.search_books(params[:search]);
  		end
	end

	# Route : books/show/:id
	def show
	end

	# Route : books/search?query=search_term
	# This will be a GET http action and will 
	# retrieve book data from goodreads api
	def search(query)
		key = 'yElx2dvGSrA7utu7Gyx0Q'
		secret = '7BHgX1AqLxtL5tUu70UAFoS3KCojwnSIez7tlk2fM'

		client = Goodreads::Client.new(:api_key => key, :api_secret => secret)
		@books = client.search_books(params[:search]);
	end
end