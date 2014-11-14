# This module interfaces with Goodreads api and returns requested
# information in xml format. Our parser will then parse the xml.

require 'net/http'
require 'uri'

module GoodreadsApi

	$key = 'yElx2dvGSrA7utu7Gyx0Q'
	$secret = '7BHgX1AqLxtL5tUu70UAFoS3KCojwnSIez7tlk2fM'
	$base_url = "http://www.goodreads.com"


	def GoodreadsApi.get_book_reviews(book_id)
		url = "#{$base_url}/book/show/#{book_id}?format=JSON&key=#{$key}"
		uri = URI.parse(url)
		response = Net::HTTP.get_response(uri)
		Net::HTTP.get_print(uri)
	end

	def GoodreadsApi.get_book_reviews_by_title(book_title)
		url = "#{$base_url}/book/title.xml?key=#{$key}&title=#{book_title}"
		uri = URI.parse(url)
		response = Net::HTTP.get_response(uri)
		Net::HTTP.get_print(uri)
	end

	def GoodreadsApi.search_books(search_term)
		search_term = URI.escape(search_term)
		url = "#{$base_url}/search.xml?key=#{$key}&q=#{search_term}"
		uri = URI.parse(url)
		response = Net::HTTP.get_response(uri)
		Net::HTTP.get_print(uri)
	end

	def GoodreadsApi.search_books_by_author(author_name)
		author_name = URI.escape(author_name)
		url = "#{$base_url}/api/author_url/#{author_name}?key=#{$key}"
		uri = URI.parse(url)
		response = Net::HTTP.get_response(uri)
		Net::HTTP.get_print(uri)
	end

	def GoodreadsApi.get_book_shelves(user_id)
		url = "#{$base_url}/shelf/list.xml?key=#{$key}&id=#{user_id}"
		uri = URI.parse(url)
		response = Net::HTTP.get_response(uri)
		Net::HTTP.get_print(uri)	
	end

	def GoodreadsApi.get_user_info(user_id)
		url = "#{$base_url}/user/show/#{user_id}.xml?key=#{$key}"
		uri = URI.parse(url)
		response = Net::HTTP.get_response(uri)
		Net::HTTP.get_print(uri)
	end

end

	