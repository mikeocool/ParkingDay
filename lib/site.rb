module ParkingDay
  class Site
    include DataMapper::Resource
    
    storage_names[:default] = 'sites'
    
    property :id,           Serial
    property :slug,         String, :unique_index => true
    property :name,         String
    property :location,     String
    property :question,     String
    property :fact_one,     String
    property :fact_two,     String
    property :fact_three,   String
    property :template_id,  Integer
    property :created_at,   DateTime
    property :updated_at,   DateTime
  end
end