require 'rubygems' 
require 'sinatra' 
require "sinatra/reloader"

get '/' do
  erb :index  
end

get '/ajax/music' do
  erb :ajax_cds, layout => :blank
end

get '/music' do
  erb :music  
end

get '/band' do
  erb :band  
end

get '/media' do
  erb :media
end

get /kommunique|komm|read/ do
  erb :read
end

get '/gift' do
  erb :gift
end