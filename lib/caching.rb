module Caching 
  def cache(text) 
   # requests to / should be cached as index.html 
   uri = request.env["REQUEST_URI"] == "/" ? 'index' : request.env["REQUEST_URI"] 
   # Don't cache pages with query strings. 
   unless uri =~ /\?/ || !settings(:cache)
      uri << '.html'
      # put all cached files in a subdirectory called 'cache' 
      path = File.join(cache_path, uri) 
      # Create the directory if it doesn't exist 
      FileUtils.mkdir_p(File.dirname(path)) 
      # Write the text passed to the path 
      File.open(path, 'w') { |f| f.write( text ) } 
    end 
    return text 
  end 
  
  def sweep_cache(path)
    path += '.html'
    FileUtils.rm(File.join(cache_path, path), :force => true)
  end
  
  def cache_path
    File.join(File.dirname(__FILE__), '..', 'public')
  end
end