require File.dirname(__FILE__)+'/../site_create_map'

module ParkingDay
  class ParkingDayApp
  
    get '/' do
      @sites = Site.all
      erb :index
    end
    
    get '/sites/new' do
      @site = Site.new({:slug => 'blah'})
      erb :new
    end
  
    post '/sites/new' do
      input_map = SiteCreateMap.new
      if site = input_map.save( request.params )
        redirect "/#{site.slug}"
      else
        erb :new
      end
    end
  
  end
end