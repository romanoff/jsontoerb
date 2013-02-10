require 'erubis'
require 'json'
require 'htmlcompressor'

class JsonToErb

  def self.render_template(template_content, json_string, css_map = {})
    template = Erubis::Eruby.new(template_content)
    params = JSON.parse(json_string)
    css = lambda {|css_class| css_map[css_class] || css_class }
    html = template.result({:params => params, :css => css})
    compressor = HtmlCompressor::Compressor.new(:remove_intertag_spaces => true)
    return compressor.compress(html)
  end

end
