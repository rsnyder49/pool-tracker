class UsersController < ApplicationController 
  
  get '/signup' do 
    if Helper.logged_in?(session)
      redirect '/pools'
    end 
    erb :'users/create_user'
  end 
  
  post '/signup' do 
    if !params.has_value?("") && params[:email].include?("@")
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/pools'
    else 
      redirect '/signup'
    end
  end 
  
  get '/login' do 
    if Helper.logged_in?(session)
      redirect '/pools'
    else 
      erb :'users/login'
    end 
  end
  
  post '/login' do 
    @user = User.find_by(username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect '/pools'
    else 
      redirect '/login' 
    end 
  end
  
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end
  
  get '/logout' do 
    if Helper.logged_in?(session)
      session.clear 
    else 
      redirect '/'
    end 
    redirect '/login'
  end 
  
end 



