require 'pry'
require "sinatra/base"
require "etsiest/version"
require "etsy"

module Etsiest
 Etsy.api_key = ENV["ETSY_KEY"]
 
	class App < Sinatra::Base

 		get "/" do
      		response=Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'whiskey')
		  	response = response.result
		  	binding.pry
		  	erb :index, locals: { results: response}
      	end

    	run! if app_file == $0
    end
end
