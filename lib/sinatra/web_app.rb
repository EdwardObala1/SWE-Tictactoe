require 'sinatra'
require 'html'
require_relative 'controllers/Web_game'

get '/' do
  erb :'HTML/index.html' 
end

# to play random ai
post '/playhuman' do
  erb :":HTML/game.html"
end

post '/playrandomai' do
  erb :":HTML/game.html"
end

post '/playsmartai' do
  erb :":HTML/game.html"
end



