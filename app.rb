require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:./database/pizzashop.db"

class Product < ActiveRecord::Base

end

class Order < ActiveRecord::Base
  validates :name_customer, {presence: true, length:{minimum: 3, maximum: 60}}
  validates :phone, {presence: true, length:{minimum: 10}}
  validates :datetime_delivery, {presence: true}
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

def get_string_order(hash)
  str_orders = ""
  # {"1"=>3,"4"=>4,"2"=>5,"3"=>7}
  hash.each do |k,v|
    title = Product.find(k.to_i).title
    count = v
    str_orders +="#{title} = #{count}\n"
  end
  return str_orders
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

# from cart to order
post '/order' do
  @ord = Order.new
  orders ||= params[:list_orders]
  redirect to '/' if orders == nil || orders == ""

  hash_orders = get_param_product(orders)
  @total_sum = 0
  hash_orders.each do |k,v|
    @total_sum += (Product.find(k.to_i).price * v)
  end
  
  id_for_find = hash_orders.keys.map{|x| x.to_i}
  products = Product.find(id_for_find)
  @text_orders = get_string_order(hash_orders)
  erb :order
end

post '/ordered' do
  @ord = Order.new(params[:order])
  @text_orders = @ord.composition_orders
  @total_sum = @ord.total_price

  if @ord.save
    erb :ordered
  else
    @errors = @ord.errors.full_messages.first
    erb :order
  end

end

get '/admin' do
  @orders = Order.order(created_at: :desc)
  erb :admin
end
