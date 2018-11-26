class PoolsController < ApplicationController  
  
  get '/pools' do 
    if Helper.logged_in?(session)
      @pools = Pool.all
      erb :'pools/pools' 
    else 
      redirect '/login' 
    end 
  end
  
  get '/pools/new' do
    if Helper.logged_in?(session)
      erb :'pools/new'
    else
      redirect '/login'
    end
  end
  # get 'pools/new' do
  #   @user = Helper.current_user(session)
  #   if !!@user
  #     erb :'pools/new'
  #   else 
  #     redirect '/login'
  #   end 
  # end 
  
  get '/pools/:id' do
    if Helper.logged_in?(session) && !!Pool.find_by_id(params[:id])
      @pool = Pool.find_by_id(params[:id])
    else
      redirect '/login'
    end
    erb :'pools/show_pool'
  end
  
  # post '/pools' do
  #   @user = Helper.current_user(session)
  #   if (params.has_value?(""))
  #     redirect to '/pools/new'
  #   elsif !params.empty?
  #     @pool = Pool.create(:address => params[:address])
  #     # @pool = Pool.create(params)
  #     @user = User.find_by(params[:id])
  #     @pool.user_id = @user.id
  #     @pool.save
  #     @user.pools << @pool
  #   end
  #   redirect "/pools/#{@pool.id}"
  # end
  post '/pools' do
    if Helper.logged_in?(session)
      @user = Helper.current_user(session)
      @pool = Pool.create(:address1 => params[:address1], :address2 => params[:address2], :city => params[:city], :state => params[:state], :zip => params[:zip])
      @pool.user_id = @user.id 
      @pool.save 
      redirect "/pools/#{@pool.id}"
    else
      redirect '/login'
    end
  end 
  
  delete '/pools/:id/delete' do
    @pool = Pool.find_by_id(params[:id])
    # if @pool.username != Helper.current_user(session)
    if @pool.user_id != Helper.current_user(session).id
      redirect to '/pools'
    end
    if Helper.logged_in?(session)
      if @pool.user_id == Helper.current_user(session).id
        @pool.destroy
        redirect '/pools'
      end
    else
      redirect '/login'
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
    if @pool.user_id != Helper.current_user(session).id
      redirect to '/pools'
    end
    if !(params.has_value?(""))
      @pool.update(address1: params[:address1], address2: params[:address2], city: params[:city], state: params[:state], zip: params[:zip])
      @pool.save
    else
      redirect to "/pools/#{@pool.id}/edit"
    end
    redirect to "/pools/#{@pool.id}"
  end
  
end 



