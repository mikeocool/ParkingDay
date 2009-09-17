require 'erubis'

#force sinatra to use erubis
module Sinatra::Erb
  def erb(content, options={})
    @@erb_class = Erubis::Eruby
    render(:erb, content, options)
  end

  private

  def render_erb(content, options = {})
    @@erb_class.new(content).result(binding)
  end
end