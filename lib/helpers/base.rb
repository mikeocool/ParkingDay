module ParkingDay
  module Helpers
    module Base
      def partial(template, options = {})
        options.merge!(:layout => false)
        if collection = options.delete(:collection) then
          collection.inject([]) do |buffer, member|
            buffer << erb(template, options.merge(:layout =>
            false, :locals => {template.to_sym => member}))
        end.join("\n")
        else
          erb(template, options)
        end
      end
      
    end
  end
end