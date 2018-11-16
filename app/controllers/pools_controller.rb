class PoolsController < ApplicationController  
  
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
  
  get '/pools/:id' do
    if Helper.logged_in?(session) && !!Pool.find_by_id(params[:id])
      @pool = Pool.find_by_id(params[:id])
    else
      redirect '/login'
    end
    erb :'pools/show_pool'
  end
  
  post '/pools' do
    @user = Helper.current_user(session)
    if (params.has_value?(""))
      redirect to '/pools/new'
    elsif !params.empty?
      # @pool = Pool.create(:content => params[:content])
      @pool = Pool.create(params)
      @user = User.find_by(params[:id])
      @pool.user_id = @user.id
      @pool.save
      @user.pools << @pool
    end
    redirect "/pools/#{@pool.id}"
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
  
  get '/pools/:id/edit' do
    if Helper.logged_in?(session)
      @pool = Pool.find_by_id(params[:id])
    else
      redirect to '/login'
    end
    erb :'pools/edit_pool'
  end
  
  patch '/pools/:id' do
    @pool = Pool.find_by_id(params[:id])
    if @pool.cleaner != Helper.current_user(session)
      redirect to '/pools'
    end
    if !(params.has_value?(""))
      @pool.update(content: params[:content])
      @pool.save
     else
      redirect to "/pools/#{@pool.id}/edit"
    end
    redirect to "/pools/#{@pool.id}"
  end
  
end 



