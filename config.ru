require 'rubygems'
require File.join(File.dirname(__FILE__), 'app/app.rb')
require 'sinatra'
# require 'data_mapper'

# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

run Manager
