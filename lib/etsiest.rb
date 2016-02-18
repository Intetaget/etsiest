require 'pry'
require "sinatra/base"
require "etsiest/version"
require "etsy"
require "tilt/erb"

Etsy.api_key = ENV["ETSY_KEY"]

module Etsiest
 
	class App < Sinatra::Base

 		get "/" do
      		response=Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'death')
		  	erb :index, locals: { results: response.result }
      	end

    	run! if app_file == $0
    end
end



#For example, you have `div.topbar {...}` in your CSS file, but there are no `<div class="topbar">` tags in your HTML.
