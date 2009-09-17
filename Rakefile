require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'lib/init'


namespace :db do
  task :automigrate do
    DataMapper.auto_migrate!
  end
end

namespace :cache do
  task :clear do
    Dir[File.dirname(__FILE__)+"/public/*.html"].each do |file|
      FileUtils.rm(file)
    end
  end
end