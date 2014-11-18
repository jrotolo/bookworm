
class BooksController < ApplicationController
    require 'goodreads-api/goodreads'	
	
	# The defualt book browsing page
	def index
		key = 'yElx2dvGSrA7utu7Gyx0Q'
		secret = '7BHgX1AqLxtL5tUu70UAFoS3KCojwnSIez7tlk2fM'

		client = Goodreads::Client.new(:api_key => key, :api_secret => secret)
   		@books = client.search_books(params[:search]);
        @title = "Browse Books"
	end

	# The show page for individual books
	def show
      key = 'yElx2dvGSrA7utu7Gyx0Q'
      secret = '7BHgX1AqLxtL5tUu70UAFoS3KCojwnSIez7tlk2fM'
      
      client = Goodreads::Client.new(:api_key => key, :api_secret => secret)
      @book = client.book(params[:id])
	end

	# This will be a GET http action and will 
	# retrieve book data from goodreads api
	def search(query)
		key = 'yElx2dvGSrA7utu7Gyx0Q'
		secret = '7BHgX1AqLxtL5tUu70UAFoS3KCojwnSIez7tlk2fM'
		client = Goodreads::Client.new(:api_key => key, :api_secret => secret)
   		@books = client.search_books(params[:search]);

	end
end
