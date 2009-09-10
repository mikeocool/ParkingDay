require 'rubygems'
require 'spec'
require 'dm-core'
require "ruby-debug"
require File.dirname(__FILE__)+'/../lib/utils'

RACK_ENV = "test"


#DataMapper.setup(:default, "sqlite3::memory:")
DataMapper.setup(:default, settings(:database))

Spec::Runner.configure do |config|
  config.before(:each) do
    DataMapper.auto_migrate!
  end
end