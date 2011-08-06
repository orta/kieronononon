require 'rubygems' 
require 'sinatra' 
require "sinatra/reloader"
require "pony_heroku"

get '/' do
  @slideshow =[
    "https://btp4.s3.amazonaws.com/images/banner/dragons_banner.jpg",
    "https://btp4.s3.amazonaws.com/images/banner/banner1.jpg",
    "https://btp4.s3.amazonaws.com/images/banner/banner2.jpg",
    "https://btp4.s3.amazonaws.com/images/banner/banner3.jpg",
    "https://btp4.s3.amazonaws.com/images/banner/banner4.jpg",
    "https://btp4.s3.amazonaws.com/images/banner/banner5.jpg",
    "https://btp4.s3.amazonaws.com/images/banner/banner6.jpg",
    "https://btp4.s3.amazonaws.com/images/banner/banner7.jpg",
    "https://btp4.s3.amazonaws.com/images/banner/banner8.jpg",
    "https://btp4.s3.amazonaws.com/images/banner/banner9.jpg"] 
  @latest_komm = 10
  erb :index,  { :locals => {:title => "index"}}
end

get '/ajax/music' do
  erb :ajax_cds, { :layout => false }
end

get '/khole-intro.php' do
  erb :media
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

get '/video' do
  erb :video
end

get '/kommunique' do
  @komms = [
    { :pdf => true, :description => "Issue 1 The issue that started it all, beautiful and simple, find out about; Kierononon's favourite obscure Pokemon, how we spend our money and what they were doing on reality-TV hit Shipwrecked: Battle of the Islands 2008.<br/>Rockin!"},
    { :pdf => true, :description => "Issue 2 Coming out an exact two weeks later Issue 2 talks about Keirononon's favourite ice-cream based desert, you can also discover; what goatboy did/didnt do to his laptop, how to know if you're a hardcore fan and what kind of underwear do Kierononon jam in."},
    { :pdf => true, :description => "Issue 3 features some reviews of Kierononon's new CD, has a great scene picture - we talk about the strange rituals that we have before gigs. plus we get a question in foreign, thanks google translate!"},
    { :pdf => true, :description => "Issue 4 has instructions to make the Kieronononon special, we have the first in a set of K-Holes we also answer your questions on animals, rape and what Kierononon are made of"},
    { :pdf => true, :description => "Issue 5 announces new Kierononon gigs, remix packs, starts the KHOLE gallery and we answer what stereotypes are the members of Kieronononno - plus a guest column!"},
    { :pdf => true, :description => "Issue 6 is green! Why? Well that's not actually explained, we can assure you though, there is an explanation that we shall explain. Sometime. This issue has too much to talk about in the space we have left!"},
    { :pdf => true, :description => "Issue 7 Kieronononon discuss Pokemon again, give out some tour stories, KHole some famous guys and review a review."},
    { :pdf => true, :description => "Issue 8 KiERonononon get near the queen, get some emo poetry and compare some stuff."},
    { :pdf => false,:description => "Issue 9 Kierononon look into psychology, their new iTunes LP and talk about the meaning of life."},
    { :pdf => true, :description => "Issue 10 Kierononon apologise for once, talk about the new stuff and kompare facial hair. "}
  ]
  erb :read
end

get '/komplaint' do 
    erb :komplaints
end

get '/gift' do
  erb :gift
end

get '/email' do
    puts ""
   
   if !params["email"] || !params["komplaint"] || !params["name"]
     return erb :komplaints
   end
   
   Pony.mail(:to=>"roxxor2mail@gmail.com", 
              :from => params["email"], 
              :subject=> "komplaint from #{ params["name"] }",
              :body =>  "
               =========
               #{params['komplaint']}
               =========
               ",
              :via => :smtp, :smtp => {
                :host       => 'smtp.gmail.com',
                :port       => '587',
                :user       => ENV['GMAIL_USERNAME'],
                :password   => ENV['GMAIL_PASS'],
                :auth       => :plain,
                :domain     => "brutaltechnopunk.com"
               }
             )

  erb :thanks
end