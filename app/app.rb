ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'

class Manager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  post '/links' do
    link = Link.new(url: params[:url],
                    title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:error] = 'Password and confirmation do not match'
      erb :'users/new'
    end
  end

  run! if app_file == $0
end
