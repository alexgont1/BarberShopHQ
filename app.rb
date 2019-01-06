require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

class Visit < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
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
	# #insert info into DB info about appointment-my solution:
	# Visit.find_or_create_by(
	# 	user_name: params[:user_name],
	# 	phone: params[:phone],
	# 	date_time: params[:date_time],
	# 	barber: params[:barber],
	# 	color: params[:color])

	#insert info into DB info about appointment:
	c = Client.new
	c.name = params[:user_name]
	c.phone = params[:phone]
	c.datestamp = params[:date_time]
	c.barber = params[:barber]
	c.color = params[:color]
	c.save

	@title = "Thank you!"
	@message = Client.all

	erb :message
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	#insert info into DB message from user
	Contact.find_or_create_by(
		user_name: params[:email],
		date_time: params[:umessage])

	@title = "Thanks for your message!"
	@message = Contact.all
		
	erb :message
end