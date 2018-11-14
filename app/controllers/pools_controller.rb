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
  
  post '/tweets' do
    @user = Helpers.current_user(session)
    if (params.has_value?(""))
      redirect to '/pools/new'
    elsif !params.empty?
      @pool = Tweet.create(:content => params[:content])
      @user = User.find_by(params[:id])
      @pool.user_id = @user.id
      @pool.save
      @user.pools << @pool
    end
    redirect to "/tweets/#{@pool.id}"
  end
  
  delete '/pools/:id/delete' do
    @pool = Pool.find_by_id(params[:id])
    if @pool.cleaner != Helper.current_user(session)
      redirect to '/pools'
    end
    if Helper.logged_in?(session)
      if @pool.user_id == Helper.current_user.id
        @pool.destroy
        redirect to '/pools'
      end
    else
      redirect to '/login'
    end
  end
  
end 