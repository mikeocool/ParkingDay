module ParkingDay
  class ParkingDayApp
  
    get '/' do
      @sites = Site.all
      cache erb(:index)
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
      @site = Site.new( params['site'] )
      if @site.save
        sweep_cache('index')
        redirect '/admin/#{@site.id}/sticker'
      else
        erb :'admin/new', :layout => :'admin/layout'
      end
    end
    
    get '/admin/:id' do
      require_administrative_privileges
      
      @site = Site.get( params['id'] )
      if !@site
        status 404
        return erb(:'404')
      end
      
      erb(:'admin/edit', :layout => :'admin/layout')
    end
    
    post '/admin/:id' do
      require_administrative_privileges
      
      @site = Site.get( params['id'] )
      if !@site
        status 404
        return erb(:'404')
      end
      
      if @site.update_attributes(params['site'])
        sweep_cache(@site.slug)
        sweep_cache('index')
        redirect '/admin'
      else
        erb(:'admin/edit', :layout => :'admin/layout')
      end
    end
    
    get '/admin/:id/sticker' do
      require_administrative_privileges
      
      @site = Site.get( params[:id] )
      if !@site
        status 404
        return erb(:'404')
      end
      
      erb(:'admin/sticker', :layout => false)
    end
    
    delete '/admin/:id' do
      require_administrative_privileges
      
      @site = Site.get( params[:id] )
      if !@site
        status 404
        return erb(:'404')
      end
      sweep_cache(@site.slug)
      sweep_cache('index')
      @site.destroy
    end
    
    get '/:slug' do
      @site = Site.first( :slug => params[:slug] )
      if !@site
        status 404
        return erb(:'404')
      end
      
      cache erb(:"templates/#{@site.template_id}")
    end
    
  end
end