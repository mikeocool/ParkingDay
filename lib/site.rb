module ParkingDay
  class Site
    include DataMapper::Resource
    
    storage_names[:default] = 'sites'
    
    property :id,           Serial
    property :slug,         String, :unique_index => true
    property :first_name,   String
    property :last_name,    String
    property :location,     String
    property :question,     String
    property :fact_one,     String
    property :fact_two,     String
    property :fact_three,   String
    property :template_id,  Integer
    
  end
end