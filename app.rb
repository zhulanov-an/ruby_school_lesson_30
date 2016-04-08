require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:./database/barbershop.db"

class Client < ActiveRecord::Base

end

class Barber < ActiveRecord::Base

end

class Contact < ActiveRecord::Base

end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do
	name_user = params[:username]
	phone = params[:phone]
	datetime = params[:datetime]
	barber = params[:barber]
	color = params[:color]
  
  Client.create(
  	:name_user => name_user,
  	:phone => phone,
  	:barber => barber,
  	:color => color
  	)
	erb "OK, username is #{name_user}, #{phone}, #{datetime}, #{barber}, #{color}"
end

get '/contacts' do
  erb :contacts
end

post '/contacts' do
  
  email = params[:email]
  message = params[:message]
  Contact.create(
  	:email => email,
  	:content => message
  	)
  
  erb "OK, to mail #{@email} send message."
end

