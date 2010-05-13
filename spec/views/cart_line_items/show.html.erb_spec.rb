require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cart_line_items/show.html.erb" do
  include CartLineItemsHelper
  before(:each) do
    assigns[:cart_line_item] = @cart_line_item = stub_model(CartLineItem,
      :cart_id => 1,
      :product_id => 1,
      :quantity => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

