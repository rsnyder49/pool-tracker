class PoolController < ApplicationController  
  
  get '/pools' do 
    if Helper.logged_in?(session)
      @pools = Pool.all
  end 
end 