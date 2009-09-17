module ParkingDay
  class Site
    include DataMapper::Resource
    
    storage_names[:default] = 'sites'
    
    property :id,             Serial
    property :slug,           String, :nullable => false, 
                                      :unique_index => true, 
                                      :format => /^[A-Za-z0-9_-]+$/, 
                                      :unique => true, 
                                      :messages => {
                                        :presence => 'URL is required.',
                                        :format   => 'URL can only contain letters, numers, dashes and underscores.',
                                        :is_unique => 'URL is already taken.'
                                      }
    property :name,           String, :nullable => false
    property :location,       String
    property :favorite_color, String, :default => '#fff', :nullable => false
    property :question,       String
    property :fact_one,       String
    property :fact_two,       String
    property :fact_three,     String
    property :template_id,    Integer, :nullable => false
    property :year,           Integer, :default => 2009, :nullable => false
    property :created_at,     DateTime
    property :updated_at,     DateTime
  end
end