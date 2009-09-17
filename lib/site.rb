module ParkingDay
  class Site
    include DataMapper::Resource
    
    storage_names[:default] = 'sites'
    
    property :id,           Serial
    property :slug,         String
    property :title,        String
    property :first_name,   String
    property :last_name,   String
    property :template_id,  Integer
  end
end