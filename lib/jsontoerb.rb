require 'erubis'
require 'json'

class JsonToErb

  def self.render_template(template_content, json_string)
    template = Erubis::Eruby.new(template_content)
    params = JSON.parse(json_string)
    return template.result({:params => params})
  end

end
