require 'rubygems'
require 'sinatra/base'
require 'dm-core'
require 'dm-validations'

RACK_ENV = ENV["RACK_ENV"] ||= "development" unless defined? RACK_ENV

require File.dirname(__FILE__)+'/erubis'

require File.dirname(__FILE__)+'/utils'
require File.dirname(__FILE__)+'/site'

#load all helpers
Dir[File.dirname(__FILE__)+"/helpers/*.rb"].each do |file|
  require file
end

module ParkingDay
  class ParkingDayApp < Sinatra::Base
    configure :development do
      use Rack::ShowExceptions
      use Rack::Reloader, 0
    
      begin
        require "ruby-debug"
      rescue LoadError
      end
    end
  
    enable :logging, :static, :dump_errors
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)+'/../'
    
    #TO FIX - this is just for the form helper temporairily
    class_inheritable_accessor :_default_builder
    
    #TODO figure out how to auto include these based on file loading?
    helpers Helpers::Base, Helpers::Form, Helpers::HttpAuth
  end
end

DataMapper.setup(:default, settings(:database))

# Load all routes files.
Dir[File.dirname(__FILE__)+"/routes/*.rb"].each do |file|
  require file
end
