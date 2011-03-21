require 'rubygems' 
require 'sinatra' 
require "sinatra/reloader"

get '/' do
  erb :index  
end

get '/music' do
  erb :music  
end

get '/band' do
  erb :band  
end

get '/ajax/music' do
  erb :ajax_cds, layout => :blank
end
