require './config/environment'

class ApplicationController < Sinatra::Base 
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, 'password_security'
    set :method_override, true
  end
  
  get '/' do
    erb :index
  end	
  
  # get '/pools/new' do
  #   erb :'pools/new'
  # end

  
end