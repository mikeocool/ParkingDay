require 'rubygems'
require 'spec'
require 'dm-core'
require File.dirname(__FILE__)+'/../lib/utils'
require File.dirname(__FILE__)+'/../lib/test_job'
require File.dirname(__FILE__)+'/../lib/test_plan/test_plan'

RACK_ENV = "test"


#DataMapper.setup(:default, "sqlite3::memory:")
DataMapper.setup(:default, settings(:database))

Spec::Runner.configure do |config|
  config.before(:each) do
    DataMapper.auto_migrate!
    Barrage::ResultStore.instance.clear
  end
end