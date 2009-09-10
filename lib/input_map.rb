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
  
  def validate_input
    
  end
  
  def before_save
    true
  end
  
  def do_save
    false
  end
  
  def save( data = {} )
    @data = data
    
    validate_input
    if @errors.empty? and before_save
      return do_save
    end
    return false
  end
  
  def set_error( field, message )
    @errors[field] = message
  end
  
  def errors
    @errors
  end
end