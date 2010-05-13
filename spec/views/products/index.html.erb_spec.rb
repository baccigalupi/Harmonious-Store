require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/products/index.html.erb" do
  include ProductsHelper
  
  before(:each) do
    assigns[:products] = [
      stub_model(Product,
        :title => "value for title",
        :price => 9.99
      ),
      stub_model(Product,
        :title => "value for title",
        :price => 9.99
      )
    ]
  end

  it "renders a list of products" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
  end
end

