require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:./database/pizzashop.db"

class Product < ActiveRecord::Base

end

get '/' do
  @products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

post '/cart' do
  orders = params[:list_counts]
  @products = Product.all
  # product_1=3,product_4=4,product_2=5,product_3=7
  erb :index
end