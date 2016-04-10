require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:./database/barbershop.db"

class Client < ActiveRecord::Base
  validates :name_user, presence: true, length: {minimum: 3}
  validates :phone, presence: true
  validates :barber, presence: true
  validates :color, presence: true
  validates :datestamp_visit, presence: true

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
  @cl = Client.new
	erb :visit
end

post '/visit' do
  @cl = Client.new(params[:client])
  
  if @cl.save
    last_user = Client.last
    erb "OK, <br />Username is #{last_user.name_user}<br />\
    We call yon on phone #{last_user.phone},<br />\
    We are waiting for you to #{last_user.datestamp_visit},<br />\
    Your barber #{last_user.barber}"
  else
    @errors = @cl.errors.full_messages.first
    erb :visit
  end
end

get '/contacts' do
  erb :contacts
end

post '/contacts' do
  cont = Contact.new(params[:contact])
  Contact.save(cont) ? erb("OK, saved!") : halt(erb("Bad, not saved :("))
end

get '/barber/:id' do
  @barber = Barber.find(params[:id])
  erb :barber
end