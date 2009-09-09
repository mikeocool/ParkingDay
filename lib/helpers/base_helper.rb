module ParkingDay
  class ParkingDayApp
    
    helpers do
      def partial(page, options={})
        erb page, options.merge!(:layout => false)
      end
    end
    
  end
end