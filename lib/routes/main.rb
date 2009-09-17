module ParkingDay
  class ParkingDayApp
  
    get '/' do
      @sites = Site.all
      erb :index
    end
    
    get '/admin' do
      require_administrative_privileges
      @sites = Site.all
      erb :'admin/index', :layout => :'admin/layout'
    end
    
    get '/admin/new' do
      require_administrative_privileges
      @site = Site.new()
      erb :'admin/new', :layout => :'admin/layout'
    end
  
    post '/admin/new' do
      require_administrative_privileges
      @site = Site.new( params['parking_day::site'] )
      if @site.save
        erb 'admin/:sticker'
      else
        erb :'admin/new', :layout => :'admin/layout'
      end
    end
    
    get '/admin/:id' do
      require_administrative_privileges
      
      @site = Site.get( params[:id] )
      if !@site
        status 404
        return erb(:'404')
      end
      
      erb(:'admin/edit')
    end
    
    post '/admin/:id' do
      require_administrative_privileges
      
      @site = Site.get( params[:id] )
      if !@site
        status 404
        return erb(:'404')
      end
      
      if @site.update_attributes(params['parking_day::site'])
        redirect '/admin/index'
      else
        erb(:'admin/edit')
      end
    end
    
    delete '/admin/:id' do
      require_administrative_privileges
      
      @site = Site.get( params[:id] )
      if !@site
        status 404
        return erb(:'404')
      end
      
      @site.destroy
      
    end
    
    get '/:slug' do
      @site = Site.first( :slug => params[:slug] )
      if !@site
        status 404
        return erb(:'404')
      end
      
      #TODO: caching
      erb :"templates/#{@site.template_id}"
    end
    
  end
end