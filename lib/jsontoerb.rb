require 'erubis'
require 'json'

class JsonToErb

  def self.render_template(template_content, json_string, css_map = {})
    template = Erubis::Eruby.new(template_content)
    params = JSON.parse(json_string)
    css = lambda {|css_class| css_map[css_class] || css_class }
    return template.result({:params => params, :css => css})
  end

end
