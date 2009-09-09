require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'lib/init'


namespace :db do
  task :automigrate do
    DataMapper.auto_migrate!
  end
end