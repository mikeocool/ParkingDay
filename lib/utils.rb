require 'yaml'
  
def settings(key)
  $settings ||= YAML.load_file(File.dirname(__FILE__)+"/../config/settings.yml")[RACK_ENV.to_sym]

  unless $settings.include?(key)
    message = "No setting defined for #{key.inspect}."
    defined?(logger) ? logger.warn(message) : $stderr.puts(message)
  end

  $settings[key]
end

def escape_xml(s)
  Erubis::XmlHelper.escape_xml(s)
end