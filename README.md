##Useful checklist for exec migration

###Preparation

1. install gem with bundle

    source "https://rubygems.org"

    gem "sinatra"

    gem "sinatra-reloader"

    gem "pony"

    gem "sqlite3"

    gem "activerecord"

    gem "sinatra-activerecord"

    gem "sinatra-contrib"

    group :development do
      gem "tux"
    end

2. Make Rakefile with lines for example for sinatra:
  
  require "./app"

  require "sinatra/activerecord/rake"

  and run rake -T for check it's work

###Common action

1. set :database ...
2. create model(in our privatcse in file 'app.rb' class Barber < ActiveRecord::Base fore example)
3. make file migration "rake db:create_migration NAME='...' "
4. edit migration file with special syntax ActiveRecord
5. exec migration file with comand "rake db:migrate" Success!

