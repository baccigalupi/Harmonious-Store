require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/carts/show.html.erb" do
  include CartsHelper
  before(:each) do
    assigns[:cart] = @cart = stub_model(Cart,
      :total => 9.99
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/9\.99/)
  end
end

