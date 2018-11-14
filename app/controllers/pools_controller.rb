class PoolController < ApplicationController  
  
  get '/pools' do 
    if Helper.logged_in?(session)
      @pools = Pool.all
      erb :'pools/pools' 
    else 
      redirect '/login' 
    end 
  end
  
  get 'pools/new' do 
    if Helper.logged_in?(session)
      erb :'pools/new'
    else 
      redirect '/login'
    end 
  end 
  
  get '/tweets/:id' do
    if Helpers.is_logged_in?(session)
      @tweet = Tweet.find_by_id(params[:id])
    else
      redirect to '/login'
    end
    erb :'pools/show_pool'
  end
  
end 