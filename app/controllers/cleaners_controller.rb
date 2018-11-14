class CleanerController < ApplicationController 
  
  get '/signup' do 
    if Helper.logged_in?(session)
      redirect '/pools'
    end 
    erb :create_user
  end 
  
  post '/signup' do 
    if !params.has_value?("") && params[:email].include?("@")
      @user = User.create(name: params[:username], email: params[:email], password: params[:password])
      @user[:user_id] = @user.id
      redirect '/pools'
    else 
      redirect 'signup'
  end 
  
  get '/login' do 
    if Helper.logged_in?(session)
      redirect '/pools'
    else 
      erb ':cleaners/login'
    end 
  end
  
  post '/login' do 
    @user = User.find_by(username => params[:username]
  end 
  
end 


