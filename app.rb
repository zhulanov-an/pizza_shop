require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:./database/barbershop.db"

get '/' do
	erb :index
end

get '/about' do
	erb :about
end