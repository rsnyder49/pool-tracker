require './config/environment'

class ApplicationController < Sinatra::Base 
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, 'password_security'
  end
  
  get '/' do
    erb :index
  end	
  
  # get '/pools/new' do
  #   "Hello World"
  # end
    get 'pools/new' do 
    if Helper.logged_in?(session)
      erb :'pools/new'
    else 
      redirect '/login'
    end 
  end
  
end