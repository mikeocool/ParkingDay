require File.dirname(__FILE__)+'/input_map'
require File.dirname(__FILE__)+'/site'

module ParkingDay
  class SiteCreateMap < InputMap
    model Site
    
    property :slug
    
    def validate_input
      if ! @data[:slug].match(/^[A-Za-z0-9_\-]+$/)
        set_error(:slug, 'Slug must be alphanumeric.')
      end
    end
  
    def do_save
      record = self.class.model.new
      record.attributes = @data
      return record
    end
  end
end