require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.order "created_at DESC"
end

get '/' do
	#@barbers = Barber.all
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do
	# user_name, phone, date_time
	@user_name = params[:user_name]
	@phone = params[:phone]
	@date_time = params[:date_time]
	@barber = params[:barber]
	#https://github.com/tkrotoff/jquery-simplecolorpicker
	@color = params[:color]

	@title = "Thank you!"
	@message = "Dear #{@user_name}, your color is #{@color}, #{@barber} will wait for you on #{@date_time}"

	erb :message
end