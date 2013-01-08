require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Jsontoerb" do
  it "should render template from json" do
    JsonToErb.render_template("<div><%= params['name'] %></div>", "{\"name\": \"Name\"}").should == "<div>Name</div>"
  end
end
