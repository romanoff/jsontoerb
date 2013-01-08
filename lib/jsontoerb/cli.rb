require 'jsontoerb'

class JsonToErb::CLI
  def self.start(*args)
    if args.length == 2
      if !File.exist?(args[0])
        puts "Template does not exist"
        return
      end
      template_file = File.open(args[0], "rb")
      json = args[1]
      output = JsonToErb.render_template(template_file.read, json)
      puts output
      template_file.close
    end
  end
end
