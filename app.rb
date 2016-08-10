require 'rubygems'
require 'sinatra'
require "sinatra/reloader"
require "sqlite3"
require "sinatra/activerecord"

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true
  validates :adress, presence: true
  validates :order_list, presence: true
end

before  do
    @products = Product.all
end

def parse_order_line(order_line)
    orders_list = order_line.split(',')
    arr = []
    orders_list.each do |order|
        order_new = order.split('=')
        arr.push order_new
    end
    arr
end

get '/' do
  erb :index
end

post '/card' do
  @order_line = parse_order_line(params[:orders])
  @total_price = 0
  @order_line.each do |item|
      item[0] = @products.find(item[0])
      @total_price += (item[0].price.to_i * item[1].to_i)
  end
  if @order_line.empty?
    erb "Your card is empty"
    else
    erb :card2
  end
end


post '/order' do
  @o = Order.new params[:order]
  if @o.save
    erb "Спасибо за заказ! Наш Менеджер свяжется с вами в течение 10 минут <script>localStorage_clean()</script>"
  else
    @error = @o.errors.full_messages.first
    @order_line = parse_order_line(params[:order][:order_list])
    @total_price = 0
    @order_line.each do |item|
        item[0] = @products.find(item[0])
        @total_price += (item[0].price.to_i * item[1].to_i)
    end
    erb :card2
  end
end

post  '/cancelorder' do
  erb "Your order was deleted <script>localStorage_clean()</script>"
end

get '/orders' do
  @orders = Order.order('id DESC')
  erb :orders
end
