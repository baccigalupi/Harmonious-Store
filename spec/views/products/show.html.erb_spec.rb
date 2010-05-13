require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/products/show.html.erb" do
  include ProductsHelper
  before(:each) do
    assigns[:product] = @product = stub_model(Product,
      :title => "value for title",
      :price => 9.99
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/9\.99/)
  end
end

