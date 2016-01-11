require 'pry'
require "sinatra/base"
require "etsiest/version"
require "etsy"
require "tilt/erb"

Etsy.api_key = ENV["ETSY_KEY"]

module Etsiest
 
	class App < Sinatra::Base

 		get "/" do
      		response=Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'whiskey')
		  	erb :index, locals: { results: response.result }
      	end

    	run! if app_file == $0
    end
end
