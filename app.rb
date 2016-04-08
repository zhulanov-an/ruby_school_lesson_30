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
  	:color => color,
    :datestamp_visit=> datetime
  	)
  last_user = Client.last
	erb "OK, <br />Username is #{last_user.name_user}<br /> \
  We call yon on phone #{last_user.phone},<br />  \
  We are waiting for you to #{last_user.datestamp_visit},<br /> \
  Your barber #{last_user.barber}"
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

