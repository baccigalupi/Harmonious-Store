require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/carts/index.html.erb" do
  include CartsHelper
  
  before(:each) do
    assigns[:carts] = [
      stub_model(Cart,
        :total => 9.99
      ),
      stub_model(Cart,
        :total => 9.99
      )
    ]
  end

  it "renders a list of carts" do
    render
    response.should have_tag("tr>td", 9.99.to_s, 2)
  end
end

