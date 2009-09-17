module ParkingDay
  class ParkingDayApp
  
    get '/' do
      @sites = Site.all
      erb :index
    end
    
    get '/admin' do
      require_administrative_privileges
      @sites = Site.all
      erb :'admin/index'
    end
    
    get '/admin/new' do
      require_administrative_privileges
      @site = Site.new()
      erb :new
    end
  
    post '/admin/new' do
      require_administrative_privileges
      @site = Site.new( params['parking_day::site'] )
      if @site.save
        erb 'admin/:sticker'
      else
        erb :new
      end
    end
    
    get '/admin/:id' do
      require_administrative_privileges
    end
    
    post '/admin/:id' do
      require_administrative_privileges
    end
    
    delete '/admin/:id' do
      require_administrative_privileges
    end
    
    get '/:slug' do
      @site = Site.first( :slug => params[:slug] )
      if !@site
        status 404
        return erb(:'404')
      end
      
      
      
    end
    
  end
end