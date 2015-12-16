ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/data_mapper_setup'
require './app/models/link'
require './app/models/tag'

class Manager < Sinatra::Base

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  run! if app_file == $0
end
