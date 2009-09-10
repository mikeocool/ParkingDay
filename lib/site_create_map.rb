require File.dirname(__FILE__)+'/input_map'

module ParkingDay
  class SiteCreateMap < InputMap
    def validate_input
      if ! @data[:slug].match(/^[A-Za-z0-9_\-]+$/)
        set_error(:slug, 'Slug must be alphanumeric.')
      end
    end
  
    def do_save
    
    end
  end
end