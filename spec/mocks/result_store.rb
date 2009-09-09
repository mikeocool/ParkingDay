require 'singleton'

class ResultStore
  include Singleton
  
  def initialize
    @data = {}
  end
  
  def get(key)
    return @data[key]
  end
  
  def set(key, val)
    @data[key] = val
  end
  
  def incr(key)
    @data[key] ||= 0
    @data[key] += 1
  end
  
  def clear
    @data = {}
  end
  
end