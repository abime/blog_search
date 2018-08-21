class BlogsController < ApplicationController

def welcome; end

	def search
		@key_array = []
		@index_array= []
		@search_key = params[:search_key].downcase
		response = HTTParty.get('https://www.oorjan.com/blog/wp-json/wp/v2/posts')
		@response_array = response.to_a
		hash_response = @response_array.collect{|a|  hash = {a["id"]=>a["title"]["rendered"]}}
		hash_response.each do |response|
			if response.values.first.downcase.include?@search_key
				@key_array << response.keys.first
				@index_array << hash_response.find_index(response)
			end
		end
	end

end
