require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cart_line_items/index.html.erb" do
  include CartLineItemsHelper
  
  before(:each) do
    assigns[:cart_line_items] = [
      stub_model(CartLineItem,
        :cart_id => 1,
        :product_id => 1,
        :quantity => 1
      ),
      stub_model(CartLineItem,
        :cart_id => 1,
        :product_id => 1,
        :quantity => 1
      )
    ]
  end

  it "renders a list of cart_line_items" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

