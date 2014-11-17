require 'client/books'
require 'client/reviews'
require 'client/authors'
require 'client/users'
require 'client/shelves'
require 'client/friends'

module Goodreads
	class Client
		include Goodreads::Request
		include Goodreads::Books
		include Goodreads::Reviews
		include Goodreads::Authors
		include Goodreads::Users
		include Goodreads::Shelves
		include Goodreads::Friends

		attr_reader :api_key, :api_secret, :oauth_token

		def initialize(opt={})
			@api_key = opt[:api_key] || Goodreads.config[:api_key]
			@api_secret = opt[:api_secret] || Goodreads.config[:api_secret]
			@oauth_token = opt[:oauth_token]
		end
	end
end