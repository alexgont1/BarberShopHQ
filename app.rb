require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	#validation of input (using method 'save'):
	validates :name, precence: true
	validates :phone, precence: true
	validates :datestamp, precence: true
	validates :color, precence: true
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
	#insert info into DB info about appointment:
	c = Client.new params[:client]
	c.save #use validation in class above,if error then NO save

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