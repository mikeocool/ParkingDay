class InputMap
  class << self    
    def model( a_model = nil )
      @model = a_model if a_model
      @model
    end
    
    def property( name, attrs = {} )
      @properties = {} if ! @properties
      
    end
  end
  
  def initialize
    @errors = {}
  end
  
  def before_save
    true
  end
  
  def do_save
    false
  end
  
  def save( data = {} )
    @data = data
    if before_save
      return do_save
    end
  end
end