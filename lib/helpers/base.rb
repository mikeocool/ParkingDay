module ParkingDay
  module BaseHelper
    def partial(page, options={})
      erb page, options.merge!(:layout => false)
    end
  end
end