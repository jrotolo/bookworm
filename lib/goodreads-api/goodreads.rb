require 'goodreads/request'
require 'goodreads/client'

# The wrapper module the will create a new instance of Client
# All request to Goodreads will be done through the client ohject
module Goodreads
	@@opt = {}

	# Create an instance of the Client
	def self.new(opt={})
		Goodreads::Client.new(opt)
	end

	# Define the global configurations
	def self.set_config(opt={})
		@@opt[:api_key] = opt[:api_key]
		@@opt[:api_secret] = opt[:api_secret]
		@@opt
	end

	# Get global config
	def self.config
		@@opt
	end

	# Reset global config
	def self.reset_config
		@@opt = {}
	end
end