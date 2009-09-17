module ParkingDay
  module Helpers
    module Base
      def partial(page, options={})
        erb page, options.merge!(:layout => false)
      end
    end
  end
end