require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Jsontoerb" do
  it "should render template from json" do
    JsonToErb.render_template("<div><%= params['name'] %></div>", "{\"name\": \"Name\"}").should == "<div>Name</div>"
  end

  it "should render template with css class from json" do
    JsonToErb.render_template("<div class='<%= css['cssClass']%>'><%= params['name'] %></div>", "{\"name\": \"Name\"}").should == "<div class='cssClass'>Name</div>"
  end

  it "should use css map while rendering template" do
    template = "<div class='<%= css['cssClass']%>'><%= params['name'] %></div>"
    JsonToErb.render_template(template, "{\"name\": \"Name\"}", {"cssClass" => "a"}).should == "<div class='a'>Name</div>"      
  end

end
