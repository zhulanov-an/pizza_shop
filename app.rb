require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:./database/pizzashop.db"

class Product < ActiveRecord::Base

end

class Order < ActiveRecord::Base

end

def get_param_product(row_orders)
  hash_orders = {}
  # "product_1=3,product_4=4,product_2=5,product_3=7"
  row_orders.split(',').each do |item|
    temp_item = item.split('=')
    id_product = temp_item[0].gsub('product_','')
    value = temp_item[1].to_i
    hash_orders[id_product] = value
  end
  return hash_orders
  # {"1"=>3,"4"=>4,"2"=>5,"3"=>7}
end

get '/' do
  @products = Product.all
  erb :index
end

get '/about' do
	erb :about
end

# get '/cart' do
#   erb :cart
# end

post '/cart' do
  orders ||= params[:list_orders]
  redirect to '/' if orders == nil || orders == ""

  # "product_1=3,product_4=4,product_2=5,product_3=7"
  @hash_orders = get_param_product(orders)
  # {"1"=>3,"4"=>4,"2"=>5,"3"=>7}

  # get total sum
  @total_sum = 0
  @hash_orders.each do |k,v|
    @total_sum += (Product.find(k.to_i).price * v)
  end

  # for table cart
  id_for_find = @hash_orders.keys.map{|x| x.to_i}
  @products = Product.find(id_for_find)

  erb :cart
end

post '/order' do
  # orders ||= params[:list_orders]
  # redirect to '/' if orders == nil || orders == ""
  erb :order
end