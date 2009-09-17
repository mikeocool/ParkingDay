require 'fileutils'

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
    property :favorite_color, String, :default => 'FFFFFF', :nullable => false
    property :question,       String
    property :fact_one,       String
    property :fact_two,       String
    property :fact_three,     String
    property :link_title,     String
    property :link_url,       String
    property :template_id,    Integer, :nullable => false
    property :year,           Integer, :default => 2009, :nullable => false
    property :created_at,     DateTime
    property :updated_at,     DateTime
    
    after :save, :save_photo
    
    def photo=(file)
      @photo = file
    end
    
    def photo
      photo_path
    end
    
    private
    
    def save_photo
      return if !@photo
      FileUtils.mv(@photo[:tempfile].path, File.dirname(__FILE__)+'/../public'+photo_path)
      @photo = nil
    end
    
    def photo_path
      "/photos/#{self.id}.jpg"
    end
    
  end
end